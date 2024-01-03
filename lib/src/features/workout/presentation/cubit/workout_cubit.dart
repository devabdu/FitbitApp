import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(WorkoutInitial());
}
