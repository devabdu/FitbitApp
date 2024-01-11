import 'package:dartz/dartz.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/workout/domain/entities/exercises.dart';
import 'package:fitbit/src/features/workout/domain/entities/workout.dart';
import 'package:fitbit/src/features/workout/domain/usecases/add_workout_usecases%20.dart';
import 'package:fitbit/src/features/workout/domain/usecases/get_workout_usecases.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, List<WorkoutModel>>> getWorkouts();
  Future<Either<Failure, WorkoutModel>> getOneWokout();
  Future<Either<Failure, List<WorkoutModel>>> addWorkouts(
      {required AddWorkoutParameter addWorkoutUseCaseParameter});
  Future<Either<Failure, List<ExercisesModel>>> addExerciseToWorkout({
    required ExercisesParameter exercisesParameter,
  });
}
