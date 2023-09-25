import 'package:equatable/equatable.dart';

class Day extends Equatable {
  final String name;
  final String shortcut;

  const Day({required this.name, required this.shortcut});

  @override
  List<Object?> get props => [name, shortcut];
}

List<Day> daysOfTheWeek = const [
  Day(name: 'Sunday', shortcut: 'Sun'),
  Day(name: 'Monday', shortcut: 'Mon'),
  Day(name: 'Tuesday', shortcut: 'Tue'),
  Day(name: 'Wednesday', shortcut: 'Wed'),
  Day(name: 'Thursday', shortcut: 'Thu'),
  Day(name: 'Friday', shortcut: 'Fri'),
  Day(name: 'Saturday', shortcut: 'Sat'),
];

class WorkoutRoutine extends Equatable {
  final String program;
  final int? numberOfTimes;

  const WorkoutRoutine({required this.program, this.numberOfTimes});

  @override
  List<Object?> get props => [program, numberOfTimes];
}

List<WorkoutRoutine> workoutRoutines = const [
  WorkoutRoutine(program: 'Full-Body', numberOfTimes: 3),
  WorkoutRoutine(program: 'Pro Spilt', numberOfTimes: 5),
  WorkoutRoutine(program: 'Push Pull Legs', numberOfTimes: 6),
  WorkoutRoutine(program: 'Upper-Lower', numberOfTimes: 4),
];

abstract class WorkoutsType {
  void addNewWorkout(String newWorkout);
  void showWorkouts();
}

class ChestWorkout implements WorkoutsType {
  final List<String> chestWorkout;
  final String? addWorkout;

  void addWorkoutToList() {
    chestWorkout.add(addWorkout!);
  }

  ChestWorkout(
      {this.chestWorkout = const [
        'Barbell Bench Press',
        'Dumbbell Bench Press',
        'Incline Bench Press',
        'Decline Press',
        'Machine Chest Press',
        'Push-Up',
        'Dip',
        'Chest Fly',
        'Dumbbell Pull-Over',
        'Machine Fly'
      ],
      this.addWorkout});

  @override
  void addNewWorkout(String newWorkout) {
    chestWorkout.add(addWorkout!);
  }

  @override
  void showWorkouts() {
    chestWorkout;
  }
}
