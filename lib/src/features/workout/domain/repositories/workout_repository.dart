import 'package:dartz/dartz.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/workout/domain/entities/exercises.dart';
import 'package:fitbit/src/features/workout/domain/entities/workout.dart';
import 'package:fitbit/src/features/workout/domain/usecases/add_workout_usecases%20.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, List<Workout>>> getWorkouts();
  Future<Either<Failure, List<Workout>>> addWorkouts(
      {required AddWorkoutParameter addWorkoutUseCaseParameter});
  Future<Either<Failure, List<Exercises>>> addExerciseToWorkout({
    required ExercisesParameter exercisesParameter,
  });
}
