// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AgnecyAdapter extends TypeAdapter<Agency> {
  @override
  final int typeId = 2;

  @override
  Agency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Agency(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Agency obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.image_url)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AgnecyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
