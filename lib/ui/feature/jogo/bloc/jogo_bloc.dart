import 'package:orpheus/controller/fase_controller.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/nota.dart';
import 'package:orpheus/data/model/questao.dart';
import 'package:rxdart/rxdart.dart';

class JogoBloc {
  var _controller = FaseController();

  BehaviorSubject<Questao> questaoObservable = BehaviorSubject();
  int _idTentativa;
  int _nivel;

  void iniciarFase(TipoJogo tipoJogo, int nivel) {
    _nivel = nivel;
    _controller.iniciarFase(tipoJogo, nivel).then((idTentativa) async {
      _idTentativa = idTentativa;
      var questao = await _controller.buscarQuestao(_idTentativa, nivel);
      questaoObservable.add(questao);
    });
  }

  void registrarResposta(Questao questao, Nota resposta) {
    _controller.registrarTentativa(questao, resposta).then((_) async {
      var questao = await _controller.buscarQuestao(_idTentativa, _nivel);
      questaoObservable.add(questao);
    });
  }

  close() {
    questaoObservable.close();
  }
}
