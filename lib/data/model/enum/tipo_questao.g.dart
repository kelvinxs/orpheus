// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_questao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TipoQuestaoAdapter extends TypeAdapter<TipoQuestao> {
  @override
  final int typeId = 5;

  @override
  TipoQuestao read(BinaryReader reader) {
    switch (reader.readByte()) {
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

  @override
  void write(BinaryWriter writer, TipoQuestao obj) {
    switch (obj) {
      case TipoQuestao.NOME_CIFRA:
        writer.writeByte(0);
        break;
      case TipoQuestao.CIFRA_NOME:
        writer.writeByte(1);
        break;
      case TipoQuestao.PARTITURA_CIFRA:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TipoQuestaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
