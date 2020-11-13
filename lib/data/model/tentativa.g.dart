// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tentativa.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TentativaAdapter extends TypeAdapter<Tentativa> {
  @override
  final int typeId = 3;

  @override
  Tentativa read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tentativa(
      id: fields[0] as String,
      nivel: fields[1] as int,
      tipoJogo: fields[2] as TipoJogo,
    );
  }

  @override
  void write(BinaryWriter writer, Tentativa obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nivel)
      ..writeByte(2)
      ..write(obj.tipoJogo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TentativaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
