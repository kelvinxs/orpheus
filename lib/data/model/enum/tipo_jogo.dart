import 'package:hive/hive.dart';

part 'tipo_jogo.g.dart';

@HiveType(typeId: 4)
enum TipoJogo {
@HiveField(0)HISTORIA,
@HiveField(1)SEM_FIM }

extension TipoJogoExtention on TipoJogo {
  int get codigo {
    switch (this) {
      case TipoJogo.HISTORIA:
        return 0;
      case TipoJogo.SEM_FIM:
        return 1;
      default:
        return null;
    }
  }
}

extension toTipoJogoIntParseExtension on int {
  TipoJogo toTipoJogo() {
    if (this == null) return null;
    switch (this) {
      case 0:
        return TipoJogo.HISTORIA;
      case 1:
        return TipoJogo.SEM_FIM;
      default:
        return null;
    }
  }
}
