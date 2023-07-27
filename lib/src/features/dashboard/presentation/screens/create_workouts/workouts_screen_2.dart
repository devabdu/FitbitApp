import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_text_button_large.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/create_workouts/workouts_screen_1.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/custom_app_bar.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/custom_text_field.dart';
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

  final List<int> sets = [1, 2, 3];
  final List<int> reps = [12, 10, 8];
  final List<double> weights = [15, 17.5, 20];

  // final List<ExercisesData> _exerciseData = [
  //   ExercisesData(sets: 1, reps: 12, weights: 15),
  //   ExercisesData(sets: 2, reps: 10, weights: 17.5),
  //   ExercisesData(sets: 3, reps: 8, weights: 20),
  // ];

  bool isPressed = false;
  bool isShowDataOfExercies = false;

  // final List<Map<String, dynamic>> _data = [
  //   {'sets': 1, 'reps': 12, 'weights': 15},
  //   {'sets': 2, 'reps': 10, 'weights': 17.5},
  //   {'sets': 3, 'reps': 8, 'weights': 20},
  // ];

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: const Text(
        AppStrings.legDay,
      ),
      onPressed: () {},
      icon: AppIcons.moreHorizOutlined,
    );
  }

  Widget _buildAddExerciseTextAndButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppPharses()
              .phraseConstruction(AppStrings.addExercies, AppStrings.legDay),
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: AppFontSize.s16),
        ),
        CustomTextButtonLarge(
          textButton: AppStrings.add,
          width: AppSize.s80.w,
          height: AppSize.s40.h,
          onPressed: () {
            _showModalBottomSheet(context);
          },
        ),
      ],
    );
  }

  Widget _buildAddExerciseToListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: _exercicesAdd.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListTile(
              title: Text(
                _exercicesAdd[index],
                style: const TextStyle(color: Colors.black),
              ),
              trailing: SizedBox(
                width: AppSize.s150.w,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      icon: const Icon(AppIcons.add),
                    ),
                    if (isPressed)
                      Row(
                        children: [
                          IconButton(
                            icon: isShowDataOfExercies
                                ? const Icon(AppIcons.arrowDown)
                                : const Icon(AppIcons.arrowUp),
                            onPressed: () {
                              setState(() {
                                isShowDataOfExercies = !isShowDataOfExercies;
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
                      ),
                  ],
                ),
              ),
            ),
            if (isShowDataOfExercies) _buildAddSetsAndRepsAndWeights(),
          ],
        );
      },
    );
  }

  Widget _buildAddSetsAndRepsAndWeights() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p10.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: AppPadding.p10.w),
            child: Row(
              children: [
                const Text(AppStrings.sets),
                SizedBox(width: AppSize.s75.w),
                const Text(AppStrings.reps),
                SizedBox(width: AppSize.s70.w),
                const Text(AppStrings.weights),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
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

  Widget _buildRestButton(BuildContext context) {
    return CustomTextButtonLarge(
      textButton: AppStrings.rest,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.workouts_3Route);
      },
    );
  }

  Widget _buildDoneButton(BuildContext context) {
    return CustomTextButtonLarge(
      textButton: AppStrings.done,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.workouts_4Route);
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
            padding: ConstEdgeInsetsGeometry.defaultPaddingWorkoutScreens,
            child: Column(
              children: [
                _buildAddExerciseTextAndButton(context),
                Flexible(
                  child: Container(child: _buildAddExerciseToListView()),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: AppSize.s150.h,
            right: AppSize.s40.w,
            left: AppSize.s40.w,
            child: _buildRestButton(context),
          ),
          Positioned(
            bottom: AppSize.s60.h,
            right: AppSize.s40.w,
            left: AppSize.s40.w,
            child: _buildDoneButton(context),
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        String newItem = '';
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: AppSize.s250.h,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomTextField(
                    textEditingController: _exerciseController,
                    textSection: AppStrings.exeeciseName,
                    onChangedTextField: (exercise) => newItem = exercise,
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
                      CustomTextButtonLarge(
                        textButton: AppStrings.save,
                        width: AppSize.s80.w,
                        height: AppSize.s40.h,
                        onPressed: () {
                          setState(() {
                            _exercicesAdd.add(newItem);
                            newItem = '';
                          });
                          Navigator.pop(context);
                        },
                      ),
                      CustomTextButtonLarge(
                        textButton: AppStrings.cancel,
                        width: AppSize.s80.w,
                        height: AppSize.s40.h,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
