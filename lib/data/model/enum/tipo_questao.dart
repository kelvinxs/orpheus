import 'package:hive/hive.dart';

part 'tipo_questao.g.dart';

@HiveType(typeId: 5)
enum TipoQuestao {
  @HiveField(0)
  NOME_CIFRA,
  @HiveField(1)
  CIFRA_NOME,
  @HiveField(2)
  PARTITURA_CIFRA
}

extension TipoQuestaoExtention on TipoQuestao {
  int get codigo {
    switch (this) {
      case TipoQuestao.NOME_CIFRA:
        return 0;
      case TipoQuestao.CIFRA_NOME:
        return 1;
      case TipoQuestao.PARTITURA_CIFRA:
        return 2;
      default:
        return null;
    }
  }
}

extension toTipoQuestaoIntParseExtension on int {
  TipoQuestao toTipoQuestao() {
    if (this == null) return null;
    switch (this) {
      case 0:
        return TipoQuestao.NOME_CIFRA;
      case 1:
        return TipoQuestao.CIFRA_NOME;
      case 2:
        return TipoQuestao.PARTITURA_CIFRA;
      default:
        return null;
    }
  }
}
