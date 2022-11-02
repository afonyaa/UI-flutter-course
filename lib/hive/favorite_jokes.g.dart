// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_jokes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteJokesAdapter extends TypeAdapter<FavoriteJokes> {
  @override
  final int typeId = 1;

  @override
  FavoriteJokes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteJokes(
      value: fields[0] as String,
      id: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteJokes obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteJokesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
