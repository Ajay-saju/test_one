// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatogaryDetailsAdapter extends TypeAdapter<CatogaryDetails> {
  @override
  final int typeId = 0;

  @override
  CatogaryDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatogaryDetails(
      catogary: fields[0] as String,
      subCatogary: (fields[1] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CatogaryDetails obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.catogary)
      ..writeByte(1)
      ..write(obj.subCatogary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatogaryDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubcategoryAdapter extends TypeAdapter<Subcategory> {
  @override
  final int typeId = 2;

  @override
  Subcategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Subcategory(
      category: fields[0] as String,
      subCatogary: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Subcategory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.subCatogary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubcategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
