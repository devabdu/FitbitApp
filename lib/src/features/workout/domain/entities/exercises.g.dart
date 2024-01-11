// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExercisesModelAdapter extends TypeAdapter<ExercisesModel> {
  @override
  final int typeId = 1;

  @override
  ExercisesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExercisesModel(
      exerciseName: fields[0] as String,
      exerciseWeights: fields[1] as int,
      exerciseReps: fields[2] as int,
      exerciseSets: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExercisesModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.exerciseName)
      ..writeByte(1)
      ..write(obj.exerciseWeights)
      ..writeByte(2)
      ..write(obj.exerciseReps)
      ..writeByte(3)
      ..write(obj.exerciseSets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExercisesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
