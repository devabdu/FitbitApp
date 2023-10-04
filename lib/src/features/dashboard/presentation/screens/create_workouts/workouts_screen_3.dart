import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fitbit/src/core/utils/resources/app_colors.dart';
import 'package:fitbit/src/core/utils/resources/app_font.dart';
import 'package:fitbit/src/core/utils/resources/app_icons.dart';
import 'package:fitbit/src/core/utils/resources/app_strings.dart';
import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/create_workouts/widgets/custom_timer_control_widget.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/create_workouts/widgets/workouts_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutsScreen3 extends StatefulWidget {
  const WorkoutsScreen3({super.key});

  @override
  State<WorkoutsScreen3> createState() => _WorkoutsScreen3State();
}

class _WorkoutsScreen3State extends State<WorkoutsScreen3> {
  final CountDownController _controller = CountDownController();

  Widget _buildCircularCountDownTimer() {
    return CircularCountDownTimer(
      duration: 60,
      initialDuration: 0,
      controller: _controller,
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      ringColor: AppColors.backGroundCircleAvatar,
      ringGradient: null,
      fillColor: AppColors.lightPink.withOpacity(0.7),
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
      textFormat: CountdownTextFormat.SS,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: false,
      onComplete: () {
        // Do something when the countdown timer completes
      },
    );
  }

  Widget _buildTimerControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildPauseControl(),
        _buildStartControl(),
        _buildRestControl(),
      ],
    );
  }

  Widget _buildPauseControl() {
    return CustomTimerControl(
      onPressed: _controller.pause,
      icon: AppIcons.pause,
      titleOfControl: AppStrings.pause,
    );
  }

  Widget _buildStartControl() {
    return CustomTimerControl(
        onPressed: _controller.start,
        icon: AppIcons.play,
        titleOfControl: AppStrings.start);
  }

  Widget _buildRestControl() {
    return CustomTimerControl(
        onPressed: _controller.reset,
        icon: AppIcons.restart,
        titleOfControl: AppStrings.reset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WorkoutsAppBar(
        titleAppBar: AppStrings.legDay,
        onPressed: () {},
      ),
      body: Padding(
        padding: ConstEdgeInsetsGeometry.defaultPaddingWorkoutScreens,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCircularCountDownTimer(),
            _buildTimerControls(),
          ],
        ),
      ),
    );
  }
}
