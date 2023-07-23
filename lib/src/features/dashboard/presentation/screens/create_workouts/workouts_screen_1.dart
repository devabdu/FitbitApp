import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_text_button_large.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/custom_app_bar.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/custom_text_field.dart';
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

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: const Text(
        AppStrings.createWorkout,
      ),
      onPressed: () {},
      icon: Icons.more_horiz_outlined,
    );
  }

  Widget _buildWorkoutNameSection(BuildContext context) {
    return CustomTextField(
      textEditingController: _workoutNameController,
      textSection: AppStrings.workoutName,
      choices: _workoutsChoices,
    );
  }

  Widget _buildWorkoutDaySection(BuildContext context) {
    return CustomTextField(
      textEditingController: _workoutDayController,
      textSection: AppStrings.dayOfTheWeek,
      choices: _dayChoices,
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return CustomTextButtonLarge(
      textButton: AppStrings.next,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.workouts_2Route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p24, vertical: AppPadding.p32),
            child: Column(
              children: [
                _buildWorkoutNameSection(context),
                const Divider(
                  thickness: 0,
                  color: AppColors.transparent,
                ),
                _buildWorkoutDaySection(context),
              ],
            ),
          ),
          Positioned(
            bottom: 60.0,
            right: 40,
            left: 40,
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
