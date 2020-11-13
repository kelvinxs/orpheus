// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nota_tentativa.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotaTentativaAdapter extends TypeAdapter<NotaTentativa> {
  @override
  final int typeId = 1;

  @override
  NotaTentativa read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotaTentativa(
      idTentativa: fields[0] as String,
      idNota: fields[1] as int,
      quantidadeAcertos: fields[2] as int,
      quantidadeErros: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, NotaTentativa obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.idTentativa)
      ..writeByte(1)
      ..write(obj.idNota)
      ..writeByte(2)
      ..write(obj.quantidadeAcertos)
      ..writeByte(3)
      ..write(obj.quantidadeErros);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotaTentativaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
