// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fitbit/src/core/usecases/base_usecase.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/workout/domain/entities/workout.dart';
import 'package:fitbit/src/features/workout/domain/repositories/workout_repository.dart';

class GetWorkoutUseCase implements BaseUseCase<List<Workout>, NoParameters> {
  final WorkoutRepository workoutRepository;
  GetWorkoutUseCase(
    this.workoutRepository,
  );
  @override
  Future<Either<Failure, List<Workout>>> call(params) {
    return workoutRepository.getWorkouts();
  }
}

class AddWorkoutUseCase implements BaseUseCase<List<Workout>, NoParameters> {
  final WorkoutRepository workoutRepository;
  final String workoutName;

  AddWorkoutUseCase(
    this.workoutRepository,
    this.workoutName,
  );
  @override
  Future<Either<Failure, List<Workout>>> call(params) {
    return workoutRepository.addWorkouts(workoutName: workoutName);
  }
}

class AddExerciseUseCase implements BaseUseCase<List<Workout>, NoParameters> {
  final WorkoutRepository workoutRepository;
  final String workoutName;
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;

  AddExerciseUseCase(
    this.workoutRepository,
    this.workoutName,
    this.exerciseName,
    this.weight,
    this.reps,
    this.sets,
  );
  @override
  Future<Either<Failure, List<Workout>>> call(params) {
    return workoutRepository.addExercise(
      workoutName: workoutName,
      exerciseName: exerciseName,
      reps: reps,
      sets: sets,
      weight: weight,
    );
  }
}
