import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HistoryWorkoutsScreen extends StatelessWidget {
  HistoryWorkoutsScreen({super.key});

  PreferredSizeWidget? _buildAppBar() {
    return CustomAppBar(
      title: const Text(
        'History Workouts',
      ),
      onPressed: () {},
      icon: Icons.add,
    );
  }

  final List<String> workouts = [
    'Fullbody',
    'Leg',
    'Upperbody',
    'Fullbody',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24, vertical: AppPadding.p32),
        child: ListView.builder(
          itemCount: workouts.length, // number of cards to display
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundColor: AppColors.backGroundCircleAvatar,
                        backgroundImage:
                            AssetImage('assets/images/abs_workout_icon.png'),
                      ),
                    ),
                    title: Text(
                      '${workouts[index]} Workout',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppColors.title,
                            fontSize: AppFontSize.s14,
                          ),
                    ),
                    subtitle: Text("This is the subtitle of card $index"),
                    trailing: const Text('Delete'),
                    onTap: () {
                      // do something when the tile is tapped
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
