part of 'workout_cubit.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState();

  @override
  List<Object> get props => [];
}

class WorkoutInitialState extends WorkoutState {}

class WorkoutloadingState extends WorkoutState {}

class WorkoutSuccessState extends WorkoutState {}

class WorkoutFailurerState extends WorkoutState {
  final String errorMessage;

  const WorkoutFailurerState(this.errorMessage);
}
