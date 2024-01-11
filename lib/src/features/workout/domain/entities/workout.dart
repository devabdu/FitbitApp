import 'package:fitbit/src/features/workout/domain/entities/exercises.dart';
import 'package:hive/hive.dart';
part 'workout.g.dart';

@HiveType(typeId: 0)
class WorkoutModel extends HiveObject {
  @HiveField(0)
  final String workoutName;
  @HiveField(1)
  final String dayOfTheWeek;
  @HiveField(2)
  final List<ExercisesModel> exercises;
  WorkoutModel({
    required this.workoutName,
    required this.dayOfTheWeek,
    required this.exercises,
  });
}
