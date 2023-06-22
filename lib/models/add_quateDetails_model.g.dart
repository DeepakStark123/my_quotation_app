// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_quateDetails_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddQuoteDetalisMoidelAdapter extends TypeAdapter<AddQuoteDetalisMoidel> {
  @override
  final int typeId = 0;

  @override
  AddQuoteDetalisMoidel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddQuoteDetalisMoidel(
      quoteNo: fields[0] as int,
      moving: fields[1] as String,
      name: fields[2] as String,
      mobilenumber: fields[3] as String,
      email: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddQuoteDetalisMoidel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.quoteNo)
      ..writeByte(1)
      ..write(obj.moving)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.mobilenumber)
      ..writeByte(4)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddQuoteDetalisMoidelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
