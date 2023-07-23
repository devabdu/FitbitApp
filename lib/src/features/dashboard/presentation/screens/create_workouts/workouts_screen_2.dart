import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_text_button_large.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/create_workouts/workouts_screen_1.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/custom_app_bar.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

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
        'Leg Day',
      ),
      onPressed: () {},
      icon: Icons.more_horiz_outlined,
    );
  }

  Widget _buildAddExerciseTextAndButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Add Exercises to the leg day',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
        ),
        CustomTextButtonLarge(
          textButton: 'Add',
          width: 80,
          height: 40,
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
                width: 150.0,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                    if (isPressed)
                      Row(
                        children: [
                          IconButton(
                            icon: isShowDataOfExercies
                                ? const Icon(Icons.keyboard_arrow_down)
                                : const Icon(Icons.keyboard_arrow_up),
                            onPressed: () {
                              setState(() {
                                isShowDataOfExercies = !isShowDataOfExercies;
                              });
                            },
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.cancel,
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Sets'),
                SizedBox(width: 75),
                Text('Reps'),
                SizedBox(width: 70),
                Text('Weights'),
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
                  const Icon(
                    Icons.edit_square,
                    size: AppSize.s18,
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
      textButton: 'Rest',
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.workouts_3Route);
      },
    );
  }

  Widget _buildDoneButton(BuildContext context) {
    return CustomTextButtonLarge(
      textButton: 'Done',
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
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p24, vertical: AppPadding.p32),
            child: Column(
              children: [
                _buildAddExerciseTextAndButton(context),
                Flexible(
                  child: Container(child: _buildAddExerciseToListView()),
                ),
                // // Row(
                // //   children: [
                // //     Expanded(
                // //       child: ListView.builder(
                // //           shrinkWrap: true,
                // //           scrollDirection: Axis.vertical,
                // //           itemCount: sets.length,
                // //           itemBuilder: (BuildContext context, int index) {
                // //             return ListTile(
                // //               title: Text(sets[index].toString()),
                // //             );
                // //           }),
                // //     ),
                // //     Expanded(
                // //       child: ListView.builder(
                // //           shrinkWrap: true,
                // //           scrollDirection: Axis.vertical,
                // //           itemCount: reps.length,
                // //           itemBuilder: (BuildContext context, int index) {
                // //             return ListTile(
                // //               title: Text(reps[index].toString()),
                // //             );
                // //           }),
                // //     ),
                // //     Expanded(
                // //       child: ListView.builder(
                // //           shrinkWrap: true,
                // //           scrollDirection: Axis.vertical,
                // //           itemCount: weights.length,
                // //           itemBuilder: (BuildContext context, int index) {
                // //             return ListTile(
                // //               title: Text('${weights[index]} Kg'),
                // //             );
                // //           }),
                // //     ),
                // //   ],
                // // ),
              ],
            ),
          ),
          Positioned(
            bottom: 150.0,
            right: 40,
            left: 40,
            child: _buildRestButton(context),
          ),
          Positioned(
            bottom: 60.0,
            right: 40,
            left: 40,
            child: _buildDoneButton(context),
          ),
        ],
      ),

      // body: Stack(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(
      //           horizontal: AppPadding.p24, vertical: AppPadding.p32),
      //       child: Column(
      //         children: [
      //           _buildAddExerciseTextAndButton(context),
      //           CustomScrollView(slivers: [
      //             SliverList(
      //               delegate: SliverChildBuilderDelegate(
      //                 (context, index) {
      //                   return ListTile(
      //                     title: Text(sets[index].toString()),
      //                   );
      //                 },
      //                 childCount: sets.length,
      //               ),
      //             ),
      //           ]),
      //         ],
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 60.0,
      //       right: 40,
      //       left: 40,
      //       child: _buildDoneButton(context),
      //     ),
      //   ],
      // ),
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
            height: 250.0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomTextField(
                    textEditingController: _exerciseController,
                    textSection: 'Exercise Name',
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
                        textButton: 'Save',
                        width: 80,
                        height: 40,
                        onPressed: () {
                          setState(() {
                            _exercicesAdd.add(newItem);
                            newItem = '';
                          });
                          Navigator.pop(context);
                        },
                      ),
                      CustomTextButtonLarge(
                        textButton: 'Cancel',
                        width: 80,
                        height: 40,
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

class ExercisesData {
  final int sets;
  final int reps;
  final double weights;

  ExercisesData(
      {required this.sets, required this.reps, required this.weights});
}

class _MyDataSource extends DataTableSource {
  final List<Map<String, dynamic>> _data;

  _MyDataSource(this._data);

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) {
      return null;
    }
    final row = _data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(row['sets'].toString())),
        DataCell(Text(row['reps'].toString())),
        DataCell(Text(row['weights'].toString())),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}