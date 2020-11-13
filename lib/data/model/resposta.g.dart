// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resposta.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RespostaAdapter extends TypeAdapter<Resposta> {
  @override
  final int typeId = 2;

  @override
  Resposta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Resposta(
      id: fields[0] as String,
      idTentativa: fields[1] as String,
      nivel: fields[2] as int,
      idNotaPrincipal: fields[3] as int,
      idNotaEscolhida:fields[4] as int,
      tipoQuestao:fields[5] as TipoQuestao,
      acertou:fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Resposta obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idTentativa)
      ..writeByte(2)
      ..write(obj.nivel)
      ..writeByte(3)
      ..write(obj.idNotaPrincipal)
      ..writeByte(4)
      ..write(obj.idNotaEscolhida)
      ..writeByte(5)
      ..write(obj.tipoQuestao)
      ..writeByte(6)
      ..write(obj.acertou);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is RespostaAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
