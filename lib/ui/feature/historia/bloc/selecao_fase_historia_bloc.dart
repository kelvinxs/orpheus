import 'package:orpheus/controller/game_controller.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/fase.dart';
import 'package:rxdart/rxdart.dart';

class SelecaoFaseHistoriaBloc{
  GameController _controller = GameController();
  BehaviorSubject<List<Fase>> fasesObservable = BehaviorSubject();

  buscarFases() async {
    var fases = await _controller.listarFases(TipoJogo.HISTORIA);
    fasesObservable.add(fases);
  }

  close(){
    fasesObservable.close();
  }
}