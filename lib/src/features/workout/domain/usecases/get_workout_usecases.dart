// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:fitbit/src/core/usecases/base_usecase.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/workout/domain/entities/workout.dart';
import 'package:fitbit/src/features/workout/domain/repositories/workout_repository.dart';

class GetAllWorkoutsUseCase
    implements BaseUseCase<List<WorkoutModel>, NoParameters> {
  final WorkoutRepository workoutRepository;
  GetAllWorkoutsUseCase(
    this.workoutRepository,
  );
  @override
  Future<Either<Failure, List<WorkoutModel>>> call(params) {
    return workoutRepository.getWorkouts();
  }
}

class GetWorkoutUseCase extends BaseUseCase<WorkoutModel, NoParameters> {
  final WorkoutRepository workoutRepository;

  GetWorkoutUseCase(this.workoutRepository);

  @override
  Future<Either<Failure, WorkoutModel>> call(NoParameters parameters) async {
    return await workoutRepository.getOneWokout();
  }
}

// class WorkoutParameters extends Equatable {
//   final String workoutid;

//   const WorkoutParameters({required this.workoutid});

//   @override
//   List<Object?> get props => [workoutid];
// }
