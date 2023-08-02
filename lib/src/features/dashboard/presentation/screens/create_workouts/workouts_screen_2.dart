import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_list_item.dart';
import 'package:fitbit/src/core/widgets/custom_listview_builder.dart';
import 'package:fitbit/src/core/widgets/custom_positioned_button.dart';
import 'package:fitbit/src/core/widgets/custom_text_button.dart';
import 'package:fitbit/src/core/widgets/custom_text_field.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/create_workouts/widgets/custom_show_modal_bottom_sheet_widget.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/create_workouts/widgets/workouts_app_bar_widget.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/create_workouts/widgets/workouts_text_button_widget.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/create_workouts/workouts_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutsScreen2 extends StatefulWidget {
  const WorkoutsScreen2({super.key});

  @override
  State<WorkoutsScreen2> createState() => _WorkoutsScreen2State();
}

class _WorkoutsScreen2State extends State<WorkoutsScreen2> {
  final TextEditingController _exerciseController = TextEditingController();

  final List<Choice> _exerciseChoices = [
    Choice(title: 'Squats'),
    Choice(title: 'Lunges'),
    Choice(title: 'Calf raises'),
    Choice(title: 'Leg press'),
    Choice(title: 'Step-ups'),
    Choice(title: 'Deadlifts'),
  ];

  final List<String> _exercicesAdd = [];
  //todo change 5 static
  final List<bool> isShowDataOfExercies = List.filled(10, false);

  final List<int> sets = [1, 2, 3];
  final List<int> reps = [12, 10, 8];
  final List<double> weights = [15, 17.5, 20];

  bool isPressedAddIcon = false;
  // bool isShowDataOfExercies = false;
  AppPharses appPharses = AppPharses();

  Widget _buildAddExerciseTextAndButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          appPharses.phraseConstruction(
              AppStrings.addExercies, AppStrings.legDay),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: AppFontSize.s16,
              ),
        ),
        CustomTextButton(
          textButton: AppStrings.add,
          width: AppSize.s70.w,
          height: AppSize.s30.h,
          onPressed: () {
            _showModalBottomSheet(context);
          },
        ),
      ],
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    BottomSheetUtils.showCustomBottomSheet(
      context,
      _buildBottomSheetWidget(),
    );
  }

  Widget _buildBottomSheetWidget() {
    String? newItem;
    return Column(
      children: [
        CustomTextField(
          textEditingController: _exerciseController,
          textSection: AppStrings.exeeciseName,
          onChangedTextField: (exercise) {
            setState(() {
              newItem = exercise;
            });
          },
          selections: _exercicesAdd,
          choices: _exerciseChoices,
        ),
        const Divider(
          thickness: 0,
          color: AppColors.transparent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WorkoutsTextButton(
              textButton: AppStrings.save,
              onPressed: () {
                setState(() {
                  if (newItem == null) {
                    newItem = null;
                  } else {
                    _exercicesAdd.add(newItem!);
                  }
                });
                Navigator.pop(context);
              },
            ),
            WorkoutsTextButton(
              textButton: AppStrings.cancel,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddExerciseToListView() {
    return CustomListViewBuilder(
      itemCount: _exercicesAdd.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListItemWidget(
              isDropdownVisible: isShowDataOfExercies[index],
              _exercicesAdd[index],
              showDropDownAndDeleteIcons: _showDropDownAndDeleteIcons(index),
              showDataOfExercie: _showDataOfExercise(),
            ),
          ],
        );
        //   return Column(
        //     children: [
        //       ListTile(
        //         title: Text(
        //           _exercicesAdd[index],
        //           style: const TextStyle(color: AppColors.black),
        //         ),
        //         trailing: SizedBox(
        //           width: AppSize.s150.w,
        //           child: Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {
        //                   setState(() {
        //                     isPressedAddIcon = !isPressedAddIcon;
        //                   });
        //                 },
        //                 icon: const Icon(AppIcons.add),
        //               ),
        //               if (isPressedAddIcon) _showDropDownAndDeleteIcons(),
        //             ],
        //           ),
        //         ),
        //       ),
        //       if (isShowDataOfExercies) _showDataOfExercie(),
        //     ],
        //   );
      },
    );
  }

  Widget _showDropDownAndDeleteIcons(int index) {
    return Row(
      children: [
        IconButton(
          icon: isShowDataOfExercies[index]
              ? const Icon(AppIcons.arrowDown)
              : const Icon(AppIcons.arrowUp),
          onPressed: () {
            setState(() {
              isShowDataOfExercies[index] = !isShowDataOfExercies[index];
            });
          },
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            AppIcons.cancel,
            color: AppColors.error,
          ),
        ),
      ],
    );
  }

  Widget _showDataOfExercise() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p10.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: AppPadding.p10.w),
            child: Row(
              children: [
                const Text(AppStrings.sets),
                SizedBox(width: AppSize.s70.w),
                const Text(AppStrings.reps),
                SizedBox(width: AppSize.s60.w),
                const Text(AppStrings.weights),
              ],
            ),
          ),
          CustomListViewBuilder(
            itemCount: sets.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(sets[index].toString()),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(reps[index].toString()),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(weights[index].toString()),
                    ),
                  ),
                  Icon(
                    AppIcons.editSquare,
                    size: AppSize.s18.r,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExercisesInFlexibleContainer() {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppPadding.p10.h),
        height: AppSize.s315.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s16.r),
          border: Border.all(
            color: _exercicesAdd.isNotEmpty
                ? AppColors.backGroundCircleAvatar
                : AppColors.transparent,
          ),
        ),
        child: _buildAddExerciseToListView(),
      ),
    );
  }

  Widget _buildRestButton(BuildContext context) {
    return CustomTextButton(
      textButton: AppStrings.rest,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.workouts_3Route);
      },
      width: AppSize.s150.w,
      height: AppSize.s30.h,
    );
  }

  Widget _buildDoneButton(BuildContext context) {
    return CustomTextButton(
      textButton: AppStrings.done,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.workouts_4Route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WorkoutsAppBar(
        titleAppBar: AppStrings.legDay,
        onPressed: () {},
      ),
      body: Stack(
        children: [
          Padding(
            padding: ConstEdgeInsetsGeometry.defaultPaddingWorkoutScreens,
            child: Column(
              children: [
                _buildAddExerciseTextAndButton(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                _buildExercisesInFlexibleContainer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                if (_exercicesAdd.isNotEmpty) _buildRestButton(context),
              ],
            ),
          ),
          CustomPositionedButton(
            child: _buildDoneButton(context),
          ),
        ],
      ),
    );
  }
}
