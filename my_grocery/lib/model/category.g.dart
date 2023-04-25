// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'category.dart';

// TypeAdapterGenerator
class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 2; // Unique identifier for this type adapter

  @override
  Category read(BinaryReader reader) {
    // Read object from binary
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      id: fields[0] as int,
      name: fields[1] as String,
      image: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    // Write object to binary
    writer
      ..writeByte(3) // Number of fields in the object
      ..writeByte(0) // Index of the field for `id`
      ..write(obj.id) // Write `id` to binary
      ..writeByte(1) // Index of the field for `name`
      ..write(obj.name) // Write `name` to binary
      ..writeByte(2) // Index of the field for `image`
      ..write(obj.image); // Write `image` to binary
  }

  @override
  int get hashCode => typeId.hashCode; // Calculate hash code

  @override
  bool operator ==(Object other) => // Check for equality
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
