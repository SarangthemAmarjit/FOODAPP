// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemModal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModalAdapter extends TypeAdapter<ItemModal> {
  @override
  final int typeId = 0;

  @override
  ItemModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemModal(
      id: fields[0] as String,
      qty: fields[1] as int,
      price: fields[2] as double,
      itemimage: fields[3] as Container,
      itemname: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ItemModal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.qty)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.itemimage)
      ..writeByte(4)
      ..write(obj.itemname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
