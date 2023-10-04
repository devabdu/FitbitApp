import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/resources/app_strings.dart';
import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_positioned_button.dart';
import 'package:fitbit/src/core/widgets/custom_text_button.dart';
import 'package:fitbit/src/core/widgets/custom_text_field.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/create_workouts/widgets/workouts_app_bar_widget.dart';
import 'package:flutter/material.dart';

class WorkoutsScreen1 extends StatelessWidget {
  WorkoutsScreen1({super.key});

  final TextEditingController _workoutNameController = TextEditingController();

  final TextEditingController _workoutDayController = TextEditingController();

  final List<Choice> _workoutsChoices = [
    Choice(title: 'Chest Day'),
    Choice(title: 'Back Day'),
    Choice(title: 'Shoulder Day'),
    Choice(title: 'Arms Day'),
    Choice(title: 'Leg Day'),
    Choice(title: 'Upper Day'),
    Choice(title: 'Lower Day'),
    Choice(title: 'Push Day'),
    Choice(title: 'Pull Day'),
    Choice(title: 'Fullbody Day'),
  ];

  final List<Choice> _dayChoices = [
    Choice(title: 'Monday'),
    Choice(title: 'Tuesday'),
    Choice(title: 'Wednesday'),
    Choice(title: 'Thursday'),
    Choice(title: 'Friday'),
    Choice(title: 'Saturday'),
    Choice(title: 'Sunday'),
  ];

  Widget _buildWorkoutNameSection() {
    return CustomTextField(
      textEditingController: _workoutNameController,
      textSection: AppStrings.workoutName,
      choices: _workoutsChoices,
    );
  }

  Widget _buildWorkoutDaySection() {
    return CustomTextField(
      textEditingController: _workoutDayController,
      textSection: AppStrings.dayOfTheWeek,
      choices: _dayChoices,
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return CustomTextButton(
      textButton: AppStrings.next,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.workouts_2Route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WorkoutsAppBar(
        titleAppBar: AppStrings.createWorkout,
        onPressed: () {},
      ),
      body: Stack(
        children: [
          Padding(
            padding: ConstEdgeInsetsGeometry.defaultPaddingWorkoutScreens,
            child: Column(
              children: [
                _buildWorkoutNameSection(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                _buildWorkoutDaySection(),
              ],
            ),
          ),
          CustomPositionedButton(
            child: _buildNextButton(context),
          ),
        ],
      ),
    );
  }
}

class Choice {
  final String title;

  Choice({required this.title});
}
