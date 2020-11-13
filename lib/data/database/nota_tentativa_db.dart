import 'package:hive/hive.dart';
import 'package:orpheus/data/model/nota_tentativa.dart';

class NotaTentativaDb {
  Future<Box<List<dynamic>>> _getBox() =>
      Hive.openBox<List<dynamic>>("notas_tentativas");

  Future<void> saveOrUpdate(NotaTentativa notaTentativa) async {
    var db = await _getBox();

    var notas = db.get(notaTentativa.idTentativa);

    if (notas == null) {
      notas = [];
    }

    var index =
        notas.indexWhere((element) => element.idNota == notaTentativa.idNota);
    if (index >= 0) {
      notas.removeAt(index);
    }
    notas.add(notaTentativa);
    db.put(notaTentativa.idTentativa, notas);

    await db.close();

    return;
  }

  Future<List<NotaTentativa>> listarPorTentativa(String idTentativa) async {
    var db = await _getBox();

    var notas = db.get(idTentativa);

    return (notas ?? <NotaTentativa>[]).map((e) => e as NotaTentativa).toList();
  }

  Future<NotaTentativa> buscarPorTentativaNota(
      String idTentativa, int idNota) async {
    var db = await _getBox();

    var lista = db.get(idTentativa) ?? <NotaTentativa>[];
    var notas = lista.map((e) => e as NotaTentativa).toList();

    return notas.firstWhere((element) => element.idNota == idNota,
        orElse: () => null);
  }
}
