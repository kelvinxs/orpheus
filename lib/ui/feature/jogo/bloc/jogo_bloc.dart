import 'package:orpheus/controller/game_controller.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/nota.dart';
import 'package:orpheus/data/model/questao.dart';
import 'package:rxdart/rxdart.dart';

class JogoBloc {
  var _controller = GameController();

  BehaviorSubject<Questao> questaoObservable = BehaviorSubject();
  BehaviorSubject<bool> fimJogoObservable;
  String _idTentativa;

  JogoBloc() {
    fimJogoObservable = BehaviorSubject();
    fimJogoObservable.value = false;
  }

  void iniciarFase(TipoJogo tipoJogo, int nivel) {
    _controller.iniciarTentativaFase(tipoJogo, nivel).then((idTentativa) async {
      _idTentativa = idTentativa;
      var questao = await _controller.buscarQuestao(_idTentativa);
      questaoObservable.add(questao);
    });
  }

  void registrarResposta(Questao questao, Nota resposta) {
    _controller.registrarResposta(questao, resposta).then((resposta) async {
      var finalizouFase =
          await _controller.completouMissaoHistoria(resposta.idTentativa);
      if (finalizouFase) {
        fimJogoObservable.add(true);
      } else {
        var questao = await _controller.buscarQuestao(_idTentativa);
        questaoObservable.add(questao);
      }
    });
  }

  close() {
    questaoObservable.close();
    fimJogoObservable.close();
  }
}
