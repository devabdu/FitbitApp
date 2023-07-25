import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutsScreen3 extends StatefulWidget {
  const WorkoutsScreen3({super.key});

  @override
  State<WorkoutsScreen3> createState() => _WorkoutsScreen3State();
}

class _WorkoutsScreen3State extends State<WorkoutsScreen3> {
  final CountDownController _controller = CountDownController();

  PreferredSizeWidget? _buildAppBar() {
    return CustomAppBar(
      title: const Text(
        AppStrings.legDay,
      ),
      onPressed: () {},
      icon: Icons.more_horiz_outlined,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: ConstEdgeInsetsGeometry.defaultPaddingWorkoutScreens,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularCountDownTimer(
              duration: 60,
              initialDuration: 0,
              controller: _controller,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              ringColor: AppColors.backGroundCircleAvatar,
              ringGradient: null,
              fillColor: AppColors.iconBottomNavigation2.withOpacity(0.7),
              fillGradient: null,
              backgroundColor: Colors.transparent,
              backgroundGradient: null,
              strokeWidth: AppSize.s20.w,
              strokeCap: StrokeCap.round,
              textStyle: TextStyle(
                fontSize: AppFontSize.s32,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textFormat: CountdownTextFormat.S,
              isReverse: false,
              isReverseAnimation: false,
              isTimerTextShown: true,
              onComplete: () {
                // Do something when the countdown timer completes
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: AppPadding.p10.h),
                      child: Container(
                        width: AppSize.s70.w,
                        height: AppSize.s70.h,
                        decoration: const BoxDecoration(
                          color: AppColors.backGroundCircleAvatar,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: _controller.pause,
                          icon: const Icon(Icons.pause),
                        ),
                      ),
                    ),
                    const Text(AppStrings.pause),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: AppPadding.p10.h),
                      child: Container(
                        width: AppSize.s70.w,
                        height: AppSize.s70.h,
                        decoration: const BoxDecoration(
                          color: AppColors.backGroundCircleAvatar,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: _controller.start,
                          icon: const Icon(Icons.play_arrow),
                        ),
                      ),
                    ),
                    const Text(AppStrings.start),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: AppPadding.p10.h),
                      child: Container(
                        width: AppSize.s70.w,
                        height: AppSize.s70.h,
                        decoration: const BoxDecoration(
                          color: AppColors.backGroundCircleAvatar,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: _controller.restart,
                          icon: const Icon(Icons.rectangle_rounded),
                        ),
                      ),
                    ),
                    const Text(AppStrings.reset),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
//   double _progressValue = 0.0;
//   Timer? countdownTimer;
//   bool _isTimerRunning = false;
//   Duration myDuration = const Duration(minutes: 1);

//   @override
//   void initState() {
//     super.initState();
//   }

//   void startTimer() {
//     countdownTimer =
//         Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
//     setState(() {
//       if (_progressValue < 1.0) {
//         _progressValue += 0.1;
//       } else {
//         _progressValue = 0.0;
//       }
//     });
//   }

//   void stopTimer() {
//     setState(() => countdownTimer!.cancel());
//   }

//   void resetTimer() {
//     stopTimer();
//     setState(() => myDuration = const Duration(minutes: 1));
//   }

//   void setCountDown() {
//     const reduceSecondsBy = 1;
//     setState(() {
//       final seconds = myDuration.inSeconds - reduceSecondsBy;
//       if (seconds < 0) {
//         countdownTimer!.cancel();
//       } else {
//         myDuration = Duration(seconds: seconds);
//       }
//     });
//   }
//   // void _startTimer() {
//   //   if (!_isTimerRunning) {
//   //     _timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
//   //     _isTimerRunning = true;
//   //   }
//   // }
//   // void _stopTimer() {
//   //   if (_isTimerRunning) {
//   //     _timer.cancel();
//   //     _isTimerRunning = false;
//   //   }
//   // }
//   // void _onTimer(Timer timer) {
//   //   setState(() {
//   //     if (_counter > 0) {
//   //       _counter--;
//   //     } else {
//   //       _stopTimer();
//   //       // play sound
//   //     }
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     String strDigits(int n) => n.toString().padLeft(2, '0');
//     // final days = strDigits(myDuration.inDays);
//     // final hours = strDigits(myDuration.inHours.remainder(24));
//     final minutes = strDigits(myDuration.inMinutes.remainder(60));
//     final seconds = strDigits(myDuration.inSeconds.remainder(60));
//     return Scaffold(
//       appBar: _buildAppBar(context),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//             horizontal: AppPadding.p24, vertical: AppPadding.p32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Stack(
//               children: [
//                 Positioned(
//                   top: 50.0,
//                   bottom: 50.0,
//                   right: 40,
//                   left: 40,
//                   child: TextButton(
//                     onPressed: () {
//                       showTimePicker(
//                         context: context,
//                         initialTime: TimeOfDay.now(),
//                       );
//                       //showAboutDialog(context: context);
//                     },
//                     child: Text(
//                       '$minutes : $seconds',
//                       style: const TextStyle(
//                         fontSize: 34.0,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 240,
//                   height: 240,
//                   child: CircularProgressIndicator(
//                     strokeWidth: 18,
//                     value: 0.7,
//                     valueColor: AlwaysStoppedAnimation<Color>(
//                         AppColors.iconBottomNavigation2.withOpacity(0.7)),
//                     backgroundColor: AppColors.backGroundCircleAvatar,
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: AppPadding.p10),
//                       child: Container(
//                         width: 70,
//                         height: 70,
//                         decoration: const BoxDecoration(
//                           color: AppColors.backGroundCircleAvatar,
//                           shape: BoxShape.circle,
//                         ),
//                         child: IconButton(
//                           onPressed: stopTimer,
//                           icon: const Icon(Icons.pause),
//                         ),
//                       ),
//                     ),
//                     const Text('Pause'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: AppPadding.p10),
//                       child: Container(
//                         width: 70,
//                         height: 70,
//                         decoration: const BoxDecoration(
//                           color: AppColors.backGroundCircleAvatar,
//                           shape: BoxShape.circle,
//                         ),
//                         child: IconButton(
//                           onPressed: startTimer,
//                           icon: const Icon(Icons.play_arrow),
//                         ),
//                       ),
//                     ),
//                     const Text('Start'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: AppPadding.p10),
//                       child: Container(
//                         width: 70,
//                         height: 70,
//                         decoration: const BoxDecoration(
//                           color: AppColors.backGroundCircleAvatar,
//                           shape: BoxShape.circle,
//                         ),
//                         child: IconButton(
//                           onPressed: resetTimer,
//                           icon: const Icon(Icons.rectangle_rounded),
//                         ),
//                       ),
//                     ),
//                     const Text('Reset'),
//                   ],
//                 ),
//                 // CustomTextButtonLarge(
//                 //   textButton: 'Start',
//                 //   width: 80,
//                 //   height: 40,
//                 //   onPressed: startTimer,
//                 // ),
//                 // CustomTextButtonLarge(
//                 //   textButton: 'Stop',
//                 //   width: 80,
//                 //   height: 40,
//                 //   onPressed: () {
//                 //     if (countdownTimer == null || countdownTimer!.isActive) {
//                 //       stopTimer();
//                 //     }
//                 //   },
//                 // ),
//                 // CustomTextButtonLarge(
//                 //   textButton: 'Reset',
//                 //   width: 80,
//                 //   height: 40,
//                 //   onPressed: resetTimer,
//                 // ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
}
