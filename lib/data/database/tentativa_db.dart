import 'package:hive/hive.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/tentativa.dart';

class TentativaDb {
  Future<Box<List<dynamic>>> _getBox() =>
      Hive.openBox<List<dynamic>>("tentativas");

  Future<void> saveOrUpdate(Tentativa tentativa) async {
    var db = await _getBox();

    var tentativasNivel = db.get(tentativa.nivel);

    if (tentativasNivel == null) {
      tentativasNivel = <Tentativa>[];
    }

    var index =
        tentativasNivel.indexWhere((element) => element.id == tentativa.id);
    if (index >= 0) {
      tentativasNivel.removeAt(index);
    }
    tentativasNivel.add(tentativa);

    await db.put(tentativa.nivel, tentativasNivel);

    await db.close();

    return;
  }

  Future<Tentativa> buscarPorId(String id) async {
    var db = await _getBox();

    var keys = db.keys;

    Tentativa tentativa = null;

    for (var key in keys) {
      var lista = db.get(key) ?? <dynamic>[];
      var tentativas = lista.map((e) => e as Tentativa).toList();
      tentativa = tentativas.firstWhere((element) => element.id == id,
          orElse: () => null);
      if (tentativa != null) {
        break;
      }
    }

    return tentativa;
  }

  Future<List<Tentativa>> buscarPorNivelTipoJogo(
      int nivel, TipoJogo tipoJogo) async {
    var db = await _getBox();

    var tentativas = db.get(nivel) ?? <dynamic>[];

    return tentativas
        .map((e) => e as Tentativa)
        .where((element) => element.tipoJogo == tipoJogo)
        .toList();
  }
}
