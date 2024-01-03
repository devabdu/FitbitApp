// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:fitbit/src/core/usecases/base_usecase.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/workout/domain/entities/workout.dart';
import 'package:fitbit/src/features/workout/domain/repositories/workout_repository.dart';

class AddWorkoutUseCase
    implements BaseUseCase<List<Workout>, AddWorkoutParameter> {
  final WorkoutRepository workoutRepository;

  AddWorkoutUseCase(
    this.workoutRepository,
  );
  @override
  Future<Either<Failure, List<Workout>>> call(addWorkoutUseCaseParameter) {
    return workoutRepository.addWorkouts(
        addWorkoutUseCaseParameter: addWorkoutUseCaseParameter);
  }
}

class AddWorkoutParameter extends Equatable {
  final String workoutName;
  const AddWorkoutParameter({
    required this.workoutName,
  });

  @override
  List<Object> get props => [workoutName];
}

class AddExerciseUseCase
    implements BaseUseCase<List<Workout>, ExercisesParameter> {
  final WorkoutRepository workoutRepository;

  AddExerciseUseCase(this.workoutRepository);

  @override
  Future<Either<Failure, List<Workout>>> call(exercisesParameter) {
    return workoutRepository.addExercise(
        exercisesParameter: exercisesParameter);
  }
}

class ExercisesParameter extends Equatable {
  final String workoutName;
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  const ExercisesParameter({
    required this.workoutName,
    required this.exerciseName,
    required this.weight,
    required this.reps,
    required this.sets,
  });

  @override
  List<Object> get props {
    return [
      workoutName,
      exerciseName,
      weight,
      reps,
      sets,
    ];
  }
}
