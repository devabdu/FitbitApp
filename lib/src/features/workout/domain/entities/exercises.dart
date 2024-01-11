import 'package:hive/hive.dart';
part 'exercises.g.dart';

@HiveType(typeId: 1)
class ExercisesModel extends HiveObject {
  @HiveField(0)
  final String exerciseName;
  @HiveField(1)
  final int exerciseWeights;
  @HiveField(2)
  final int exerciseReps;
  @HiveField(3)
  final int exerciseSets;
  // bool isComleted;
  ExercisesModel({
    required this.exerciseName,
    required this.exerciseWeights,
    required this.exerciseReps,
    required this.exerciseSets,
    // required this.isComleted,
  });
}
