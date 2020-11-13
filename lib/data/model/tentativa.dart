import 'package:hive/hive.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';

part 'tentativa.g.dart';

@HiveType(typeId: 3)
class Tentativa extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  int nivel;
  @HiveField(2)
  TipoJogo tipoJogo;

  Tentativa({
    this.id,
    this.nivel,
    this.tipoJogo,
  });
}
