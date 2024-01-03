import 'package:equatable/equatable.dart';

class Exercises extends Equatable {
  final String exerciseName;
  final String exerciseWeights;
  final String exerciseReps;
  final String exerciseSets;
  bool isComleted;
  Exercises({
    required this.exerciseName,
    required this.exerciseWeights,
    required this.exerciseReps,
    required this.exerciseSets,
    required this.isComleted,
  });

  @override
  List<Object> get props {
    return [
      exerciseName,
      exerciseWeights,
      exerciseReps,
      exerciseSets,
      isComleted,
    ];
  }
}
