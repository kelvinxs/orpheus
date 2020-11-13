import 'package:hive/hive.dart';

part 'nota_tentativa.g.dart';

@HiveType(typeId: 1)
class NotaTentativa extends HiveObject {
  @HiveField(0)
  String idTentativa;
  @HiveField(1)
  int idNota;
  @HiveField(2)
  int quantidadeAcertos;
  @HiveField(3)
  int quantidadeErros;

  NotaTentativa({
    this.idTentativa,
    this.quantidadeAcertos,
    this.idNota,
    this.quantidadeErros,
  });
}
