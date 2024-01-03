import 'package:equatable/equatable.dart';
import 'package:fitbit/src/features/workout/domain/entities/exercises.dart';

class Workout extends Equatable {
  final String workoutName;
  final String dayOfTheWeek;
  final List<Exercises> exercises;
  const Workout({
    required this.workoutName,
    required this.dayOfTheWeek,
    required this.exercises,
  });

  @override
  List<Object> get props => [workoutName, dayOfTheWeek, exercises];
}
