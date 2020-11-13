import 'package:hive/hive.dart';
import 'package:orpheus/data/model/enum/tipo_questao.dart';

part 'resposta.g.dart';

@HiveType(typeId: 2)
class Resposta extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String idTentativa;
  @HiveField(2)
  int nivel;
  @HiveField(3)
  int idNotaPrincipal;
  @HiveField(4)
  int idNotaEscolhida;
  @HiveField(5)
  TipoQuestao tipoQuestao;
  @HiveField(6)
  bool acertou;

  Resposta({
    this.id,
    this.idTentativa = "",
    this.nivel = 0,
    this.tipoQuestao = null,
    this.acertou = true,
    this.idNotaEscolhida = 0,
    this.idNotaPrincipal = 0,
  });
}
