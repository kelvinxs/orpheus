import 'dart:math';

import 'package:orpheus/controller/dados/falas.dart';
import 'package:orpheus/controller/dados/fases.dart';
import 'package:orpheus/controller/dados/notas.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/enum/tipo_questao.dart';
import 'package:orpheus/data/model/fala_historia.dart';
import 'package:orpheus/data/model/fase.dart';
import 'package:orpheus/data/model/nota.dart';
import 'package:orpheus/data/model/questao.dart';

class FaseController {
  Future<List<Fase>> listarFases(TipoJogo tipoJogo) async {
    return Fases.lista.where((x) => x.tipoJogo == tipoJogo).toList();
  }

  Future<List<FalaHistoria>> listarFalas(int nivel) async {
    var lista = Falas.lista.where((x) => x.faseHistoria == nivel).toList();
    return lista[0].falas;
  }

  Future<int> iniciarFase(TipoJogo tipoJogo, int nivel) async {
    return 1;
  }

  Future<Questao> buscarQuestao(int idTentativa, int nivel) async {
    var tipoQuestao = TipoQuestao.NOME_CIFRA;

    if (nivel == 0 || nivel == 1) {
      var rng = Random().nextInt(2) % 2;
      tipoQuestao = rng == 0 ? TipoQuestao.NOME_CIFRA : TipoQuestao.CIFRA_NOME;
    } else {
      var rng = Random().nextInt(2) % 2;
      tipoQuestao =
          rng == 0 ? TipoQuestao.CIFRA_PARTITURA : TipoQuestao.PARTITURA_CIFRA;
      tipoQuestao = TipoQuestao.PARTITURA_CIFRA;
    }

    var notasPossiveis = Notas.lista.where((q) => q.nivel <= nivel).toList();
    var random = Random();
    var posicaoNota = random.nextInt(notasPossiveis.length);
    var opcoes = <Nota>[];
    var posicoesSelecionadas = <int>[posicaoNota];
    while (opcoes.length < 3) {
      var posicaoOpcao = random.nextInt(notasPossiveis.length);
      var nota = notasPossiveis[posicaoOpcao];
      if (!posicoesSelecionadas.contains(posicaoOpcao)) {
        posicoesSelecionadas.add(posicaoOpcao);
        opcoes.add(nota);
      }
    }
    var nota = notasPossiveis[posicaoNota];
    opcoes.add(nota);
    opcoes.shuffle();

    return Questao(
      idTentativa: idTentativa,
      nivel: nivel,
      opcoes: opcoes,
      notaPrincipal: nota,
      tipo: tipoQuestao,
      numero: 0,
      numAcertoNota: 0,
      numTentativasNota: 0,
    );
  }

  Future<void> registrarTentativa(Questao questao, Nota notaSelecionada) async {
    var acertou = questao.notaPrincipal.id == notaSelecionada.id;
    return;
  }
}
