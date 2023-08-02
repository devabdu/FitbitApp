import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryWorkoutsScreen extends StatelessWidget {
  HistoryWorkoutsScreen({super.key});

  final List<String> workouts = [
    'Fullbody',
    'Leg',
    'Upperbody',
    'Fullbody',
  ];

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: const Text(
        AppStrings.historyWorkouts,
      ),
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.workouts_1Route);
      },
      icon: AppIcons.add,
    );
  }

  Widget _buildListHistoryView() {
    return ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s16.r)),
          ),
          child: Column(
            children: [
              ListTile(
                leading: SizedBox(
                  width: AppSize.s50.w,
                  height: AppSize.s50.h,
                  child: const CircleAvatar(
                    backgroundColor: AppColors.backGroundCircleAvatar,
                    backgroundImage: AssetImage(AppImagesPng.absWorkoutIcon),
                  ),
                ),
                title: Text(
                  '${workouts[index]} Workout',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.title,
                        fontSize: AppFontSize.s14.sp,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: ConstEdgeInsetsGeometry.defaultPaddingWorkoutScreens,
        child: _buildListHistoryView(),
      ),
    );
  }
}
