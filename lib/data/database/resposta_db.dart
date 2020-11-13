import 'package:hive/hive.dart';
import 'package:orpheus/data/model/nota_tentativa.dart';
import 'package:orpheus/data/model/resposta.dart';

class RespostaDb {
  Future<Box<List<dynamic>>> _getBox() =>
      Hive.openBox<List<dynamic>>("respostas");

  Future<void> saveOrUpdate(Resposta resposta) async {
    var db = await _getBox();

    var respostas = db.get(resposta.idTentativa);

    if (respostas == null) {
      respostas = [];
    }

    var index =
    respostas.indexWhere((element) => element.id == resposta.id);
    if (index >= 0) {
      respostas.removeAt(index);
    }
    respostas.add(resposta);
    db.put(resposta.idTentativa, respostas);

    await db.close();

    return;
  }
}
