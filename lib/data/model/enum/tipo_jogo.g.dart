// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_jogo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TipoJogoAdapter extends TypeAdapter<TipoJogo> {
  @override
  final int typeId = 4;

  @override
  TipoJogo read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TipoJogo.HISTORIA;
      case 1:
        return TipoJogo.SEM_FIM;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, TipoJogo obj) {
    switch (obj) {
      case TipoJogo.HISTORIA:
        writer.writeByte(0);
        break;
      case TipoJogo.SEM_FIM:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TipoJogoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
