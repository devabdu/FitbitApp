import 'package:dartz/dartz.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/workout/domain/entities/workout.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, List<Workout>>> getWorkouts();
  Future<Either<Failure, List<Workout>>> addWorkouts(
      {required String workoutName});
  Future<Either<Failure, List<Workout>>> addExercise({
    required String workoutName,
    required String exerciseName,
    required String weight,
    required String reps,
    required String sets,
  });
}
