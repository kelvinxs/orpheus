import 'dart:math';

import 'package:orpheus/controller/dados/falas.dart';
import 'package:orpheus/controller/dados/fases.dart';
import 'package:orpheus/controller/dados/notas.dart';
import 'package:orpheus/data/database/nota_tentativa_db.dart';
import 'package:orpheus/data/database/resposta_db.dart';
import 'package:orpheus/data/database/tentativa_db.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/enum/tipo_questao.dart';
import 'package:orpheus/data/model/fala_historia.dart';
import 'package:orpheus/data/model/fase.dart';
import 'package:orpheus/data/model/nota.dart';
import 'package:orpheus/data/model/nota_tentativa.dart';
import 'package:orpheus/data/model/questao.dart';
import 'package:orpheus/data/model/resposta.dart';
import 'package:orpheus/data/model/tentativa.dart';
import 'package:uuid/uuid.dart';

class GameController {
  NotaTentativaDb _notaTentativaDb;
  TentativaDb _tentativaDb;
  RespostaDb _respostaDb;

  GameController() {
    _notaTentativaDb = NotaTentativaDb();
    _tentativaDb = TentativaDb();
    _respostaDb = RespostaDb();
  }

  Future<List<Fase>> listarFases(TipoJogo tipoJogo) async {
    var fases = Fases.lista.where((x) => x.tipoJogo == tipoJogo).toList();

    for (var fase in fases) {
      fase.habilitada = true;
      if (fase.nivelNotaMaxima == 0) {
        fase.habilitada = true;
      } else {
        var tentativas = await _tentativaDb.buscarPorNivelTipoJogo(
            fase.nivelPorTipo - 1, TipoJogo.HISTORIA);

        if(tentativas.isEmpty){
          fase.habilitada = false;
        }else{
          for(var t in tentativas){
            fase.habilitada = await completouMissaoHistoria(t.id);
            if(fase.habilitada){
              break;
            }
          }
        }
      }
    }

    return fases;
  }

  Future<List<FalaHistoria>> listarFalas(int nivel) async {
    return Falas.lista
        .firstWhere((x) => x.faseHistoria == nivel, orElse: () => null)
        ?.falas
        ?.toList();
  }

  Future<String> iniciarTentativaFase(
      TipoJogo tipoJogo, int nivelDificuldade) async {
    var tentativa = Tentativa(
      id: Uuid().v4(),
      tipoJogo: tipoJogo,
      nivel: nivelDificuldade,
    );
    await _tentativaDb.saveOrUpdate(tentativa);
    return tentativa.id;
  }

  Future<bool> completouMissaoHistoria(String idTentativa) async {
    var tentativa = await _tentativaDb.buscarPorId(idTentativa);

    var faseHistoria = Fases.lista.firstWhere(
        (element) =>
            tentativa.nivel == element.nivelPorTipo &&
            tentativa.tipoJogo == element.tipoJogo,
        orElse: () => null);

    var notas = Notas.lista
        .where((q) =>
            q.nivel <= faseHistoria.nivelNotaMaxima && q.nivel >= faseHistoria.nivelNotaMinima)
        .toList();

    var respostas = await _notaTentativaDb.listarPorTentativa(idTentativa);

    var finalizadas = respostas
        .where((element) =>
            element.quantidadeAcertos - element.quantidadeErros ==
            faseHistoria.quantidadeAcertosPorNota)
        .toList();

    return notas.length == finalizadas.length;
  }

  Future<Questao> buscarQuestao(String idTentativa) async {
    var tipoQuestao = TipoQuestao.NOME_CIFRA;

    var tentativa = await _tentativaDb.buscarPorId(idTentativa);
    var fase = Fases.lista.firstWhere(
        (element) =>
            tentativa.nivel == element.nivelPorTipo &&
            tentativa.tipoJogo == element.tipoJogo,
        orElse: () => null);

    if (tentativa.nivel == 0 || tentativa.nivel == 1) {
      var rng = Random().nextInt(2) % 2;
      tipoQuestao = rng == 0 ? TipoQuestao.NOME_CIFRA : TipoQuestao.CIFRA_NOME;
    } else {
      tipoQuestao = TipoQuestao.PARTITURA_CIFRA;
    }

    var notasPossiveis = Notas.lista
        .where((q) =>
            q.nivel <= fase.nivelNotaMaxima && q.nivel >= fase.nivelNotaMinima)
        .toList();
    var notasNivel = Notas.lista
        .where((q) =>
            q.nivel <= fase.nivelNotaMaxima && q.nivel >= fase.nivelNotaMinima)
        .toList();

    if (tentativa.tipoJogo == TipoJogo.HISTORIA) {
      var respostas = await _notaTentativaDb.listarPorTentativa(idTentativa);

      notasPossiveis = notasPossiveis
          .where((element) => !respostas.any((resp) =>
              resp.idNota == element.id &&
              resp.quantidadeAcertos - resp.quantidadeErros >=
                  fase.quantidadeAcertosPorNota))
          .toList();
    }

    var random = Random();
    var posicaoNota = random.nextInt(notasPossiveis.length);
    var opcoes = <Nota>[];
    var nota = notasPossiveis[posicaoNota];
    var notasSelecionadas = <String>[nota.nome];
    while (opcoes.length < 3) {
      var posicaoOpcao = random.nextInt(notasNivel.length);
      var notaOpcao = notasNivel[posicaoOpcao];
      if (!notasSelecionadas.contains(notaOpcao.nome)) {
        notasSelecionadas.add(notaOpcao.nome);
        opcoes.add(notaOpcao);
      }
    }
    opcoes.add(nota);
    opcoes.shuffle();

    var tentativaNota =
        await _notaTentativaDb.buscarPorTentativaNota(idTentativa, nota.id);

    if (tentativaNota == null) {
      tentativaNota = NotaTentativa(
        quantidadeAcertos: 0,
        quantidadeErros: 0,
      );
    }

    var acertos = tentativaNota.quantidadeAcertos;
    var qntTentativas =
        tentativaNota.quantidadeAcertos + tentativaNota.quantidadeErros;

    if (tentativa.tipoJogo == TipoJogo.HISTORIA) {
      acertos -= tentativaNota.quantidadeErros;
      var faseHistoria = Fases.lista.firstWhere(
          (element) =>
              tentativa.nivel == element.nivelPorTipo &&
              element.tipoJogo == tentativa.tipoJogo,
          orElse: () => null);
      qntTentativas = faseHistoria.quantidadeAcertosPorNota;
    }

    return Questao(
      idTentativa: tentativa.id,
      nivel: tentativa.nivel,
      opcoes: opcoes,
      notaPrincipal: nota,
      tipo: tipoQuestao,
      numAcertoNota: acertos,
      numTentativasNota: qntTentativas,
    );
  }

  Future<Resposta> registrarResposta(
      Questao questao, Nota notaSelecionada) async {
    var acertou = questao.notaPrincipal.id == notaSelecionada.id;
    var resposta = Resposta(
      id: Uuid().v4(),
      nivel: questao.nivel,
      acertou: acertou,
      idNotaEscolhida: notaSelecionada.id,
      idNotaPrincipal: questao.notaPrincipal.id,
      idTentativa: questao.idTentativa,
      tipoQuestao: questao.tipo,
    );
    await _respostaDb.saveOrUpdate(resposta);
    var tentativaNota = await _notaTentativaDb.buscarPorTentativaNota(
        questao.idTentativa, questao.notaPrincipal.id);
    if (tentativaNota == null) {
      tentativaNota = NotaTentativa(
        idNota: questao.notaPrincipal.id,
        idTentativa: questao.idTentativa,
        quantidadeErros: 0,
        quantidadeAcertos: 0,
      );
    }
    if (acertou) {
      tentativaNota.quantidadeAcertos++;
    } else {
      tentativaNota.quantidadeErros++;
    }
    await _notaTentativaDb.saveOrUpdate(tentativaNota);
    return resposta;
  }
}
