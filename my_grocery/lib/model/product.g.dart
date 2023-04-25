// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'product.dart';

// TypeAdapterGenerator
// This class is a TypeAdapter for the Product class
class ProductAdapter extends TypeAdapter<Product> {
  // typeId is a unique identifier for the ProductAdapter
  // This is necessary for Hive to determine the type of the adapter when serializing/deserializing objects
  @override
  final int typeId = 3;
  // This method reads an object from a binary stream
  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      images: (fields[3] as List).cast<String>(),
      tags: (fields[4] as List).cast<Tag>(),
    );
  }

  // This method writes an object to a binary stream
  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(5) // Number of fields in the object
      ..writeByte(0)
      ..write(obj.id) // Field 0: id
      ..writeByte(1)
      ..write(obj.name) // Field 1: name
      ..writeByte(2)
      ..write(obj.description) // Field 2: description
      ..writeByte(3)
      ..write(obj.images) // Field 3: images
      ..writeByte(4)
      ..write(obj.tags); // Field 4: tags
  }

  // This method returns the hash code of the adapter
  @override
  int get hashCode => typeId.hashCode;

  // This method checks if two adapters are equal
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
