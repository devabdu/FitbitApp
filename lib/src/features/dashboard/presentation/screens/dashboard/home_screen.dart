import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TooltipBehavior? _tooltipBehavior;
  late TrackballBehavior? _trackballBehavior;
  List<_WorkoutsProgress>? _data;
  List<_WorkoutsProgress>? _lastData;
  List<ListTile>? _listTiles;
  late List<PopupMenuEntry<String>> _popupItems;
  String? _selectedValue;

  @override
  void initState() {
    _data = getWorkoutsProgressData();
    _lastData = getLastWorkoutsProgressData();
    _popupItems = getPopupItems();
    _listTiles = getListTitles();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: const InteractiveTooltip(format: 'point.x : point.y'),
    );
    super.initState();
  }

  PreferredSizeWidget? _appBar() {
    return CustomAppBar(
      automaticallyImplyLeading: false,
      onPressed: () {},
      icon: Icons.notifications_none_outlined,
    );
  }

  Widget _buildIntroText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.welcomeBack,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColors.grey2,
              ),
        ),
        Text(
          AppStrings.userName,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: AppFontSize.s22,
                color: AppColors.title,
              ),
        ),
      ],
    );
  }

  Widget _buildWorkoutProgressChart(BuildContext context) {
    return SfCartesianChart(
      margin: const EdgeInsets.only(top: 12),
      plotAreaBorderWidth: 0,
      title: ChartTitle(
        text: AppStrings.workoutProgress,
        textStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: AppColors.title, fontSize: 15),
        alignment: ChartAlignment.near,
      ),
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        labelAlignment: LabelAlignment.center,
        labelFormat: '{value}%',
        minimum: 0,
        maximum: 100,
        interval: 20,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(color: Colors.transparent),
      ),
      trackballBehavior: _trackballBehavior,
      tooltipBehavior: _tooltipBehavior,
      // Enable legend
      legend: const Legend(isVisible: true, position: LegendPosition.bottom),
      series: <ChartSeries<_WorkoutsProgress, String>>[
        SplineSeries<_WorkoutsProgress, String>(
          dataSource: _lastData!,
          //xValueMapper: (_WorkoutsProgress workouts, _) => workouts.day,
          xValueMapper: (_WorkoutsProgress workouts, _) => workouts.day,
          yValueMapper: (_WorkoutsProgress workouts, _) => workouts.progress,
          name: AppStrings.lastWeek,
          color: AppColors.grey3,
          // Enable data label
          // dataLabelSettings: const DataLabelSettings(isVisible: true),
          enableTooltip: true,
        ),
        SplineSeries<_WorkoutsProgress, String>(
          dataSource: _data!,
          //xValueMapper: (_WorkoutsProgress workouts, _) => workouts.day,
          xValueMapper: (_WorkoutsProgress workouts, _) => workouts.day,
          yValueMapper: (_WorkoutsProgress workouts, _) => workouts.progress,
          name: AppStrings.thisWeek,
          color: AppColors.iconBottomNavigation2,
          width: 3,
          animationDuration: 1,
          // Enable data label
          //dataLabelSettings: const DataLabelSettings(isVisible: true),
          enableTooltip: true,
        ),
      ],
    );
  }

  Widget _buildTypeButton(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topRight,
        child: ElevatedButton(
          onPressed: () {
            RenderBox? button = context.findRenderObject() as RenderBox?;
            Offset buttonPosition = button!.localToGlobal(Offset.zero);
            Offset position = Offset(
              buttonPosition.dx,
              buttonPosition.dy + button.size.height,
            );
            RelativeRect rect = RelativeRect.fromSize(
              Rect.fromPoints(
                position,
                position,
              ),
              Size.zero,
            );
            showMenu<String>(
              context: context,
              position: rect,
              items: _popupItems,
            ).then((String? value) {
              if (value != null) {
                setState(() {
                  _selectedValue = value;
                });
              }
            });
          },
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(99)),
            ),
            padding: const EdgeInsets.all(0),
          ),
          child: Ink(
            decoration: const BoxDecoration(
              gradient: AppLinearGradientColors.mainColorButton,
              borderRadius: BorderRadius.all(Radius.circular(99)),
            ),
            child: Container(
              width: 90,
              height: 40,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _selectedValue ?? AppStrings.weekly,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: AppFontSize.s12, color: AppColors.white),
                  ),
                  const Icon(Icons.arrow_drop_down_rounded),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonAndProgressChart(BuildContext context) {
    return Stack(
      children: [
        _buildTypeButton(context),
        _buildWorkoutProgressChart(context),
      ],
    );
  }

  Widget _buildRowOfLatestWorkoutsAndSeeMoreText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.latestWorkout,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.title, fontSize: AppFontSize.s18),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0))),
            overlayColor: MaterialStateProperty.all(AppColors.lightPrimary),
          ),
          child: Text(
            AppStrings.seeMore,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.grey2,
                ),
          ),
        )
      ],
    );
  }

  Widget _buildListOfLatestWorkouts(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ListTile(
            title: Text(
              AppStrings.fullbodyWorkout,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: AppColors.title, fontSize: AppFontSize.s14),
            ),
            subtitle: const Text(
              AppStrings.burnCaloriesInTwentyMins,
            ),
            leading: const SizedBox(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundColor: AppColors.backGroundCircleAvatar,
                backgroundImage:
                    AssetImage('assets/images/abs_workout_icon.png'),
              ),
            ),
            trailing: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return AppLinearGradientColors.circleIcon.createShader(bounds);
              },
              child: const Icon(
                Icons.circle_outlined,
                size: 28,
              ),
            ),
            onTap: () {
              // Do something when the tile is tapped
            },
          ),
          ListTile(
            title: Text(
              AppStrings.loweBodyWorkout,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: AppColors.title, fontSize: AppFontSize.s14),
            ),
            subtitle: const Text(AppStrings.burnCaloriesInThrityMins),
            leading: const SizedBox(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundColor: AppColors.backGroundCircleAvatar,
                backgroundImage:
                    AssetImage('assets/images/lower_workout_icon.png'),
              ),
            ),
            trailing: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return AppLinearGradientColors.circleIcon.createShader(bounds);
              },
              child: const Icon(
                Icons.circle_outlined,
                size: 28,
              ),
            ),
            onTap: () {
              // Do something when the tile is tapped
            },
          ),
          ListTile(
            title: Text(
              AppStrings.abWorkout,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: AppColors.title, fontSize: AppFontSize.s14),
            ),
            subtitle: const Text(AppStrings.burnCaloriesInTwentyMins),
            leading: const SizedBox(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundColor: AppColors.backGroundCircleAvatar,
                backgroundImage:
                    AssetImage('assets/images/abs_workout_icon.png'),
              ),
            ),
            trailing: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return AppLinearGradientColors.circleIcon.createShader(bounds);
              },
              child: const Icon(
                Icons.circle_outlined,
                size: 28,
              ),
            ),
            onTap: () {
              // Do something when the tile is tapped
            },
          ),
          ListTile(
            title: Text(
              AppStrings.fullbodyWorkout,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: AppColors.title, fontSize: AppFontSize.s14),
            ),
            subtitle: const Text(AppStrings.burnCaloriesInTwentyMins),
            leading: const SizedBox(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundColor: AppColors.backGroundCircleAvatar,
                backgroundImage:
                    AssetImage('assets/images/abs_workout_icon.png'),
              ),
            ),
            trailing: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return AppLinearGradientColors.circleIcon.createShader(bounds);
              },
              child: const Icon(
                Icons.circle_outlined,
                size: 28,
              ),
            ),
            onTap: () {
              // Do something when the tile is tapped
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildIntroText(context),
            const SizedBox(
              height: 50,
            ),
            _buildButtonAndProgressChart(context),
            const SizedBox(
              height: 25,
            ),
            _buildRowOfLatestWorkoutsAndSeeMoreText(context),
            _buildListOfLatestWorkouts(context),
          ],
        ),
      ),
    );
  }

  List<_WorkoutsProgress> getWorkoutsProgressData() {
    final List<_WorkoutsProgress> data = [
      _WorkoutsProgress('Sun', 60),
      _WorkoutsProgress('Mon', 80),
      _WorkoutsProgress('Tue', 30),
      _WorkoutsProgress('Wed', 40),
      _WorkoutsProgress('Thu', 90),
      _WorkoutsProgress('Fri', 80),
      _WorkoutsProgress('Sat', 50),
    ];
    return data;
  }

  List<_WorkoutsProgress> getLastWorkoutsProgressData() {
    final List<_WorkoutsProgress> lastdata = [
      _WorkoutsProgress('Sun', 70),
      _WorkoutsProgress('Mon', 40),
      _WorkoutsProgress('Tue', 50),
      _WorkoutsProgress('Wed', 60),
      _WorkoutsProgress('Thu', 80),
      _WorkoutsProgress('Fri', 40),
      _WorkoutsProgress('Sat', 60),
    ];
    return lastdata;
  }

  List<PopupMenuEntry<String>> getPopupItems() {
    final List<PopupMenuEntry<String>> popupItems = [
      const PopupMenuItem<String>(
        value: 'Weekly',
        child: Text('Weekly'),
      ),
      const PopupMenuItem<String>(
        value: 'Monthly',
        child: Text('Monthly'),
      ),
    ];
    return popupItems;
  }

  List<ListTile> getListTitles() {
    List<ListTile> listTitles = List.generate(
      10,
      (index) => ListTile(
        title: Text('Title $index'),
        subtitle: Text('Subtitle $index'),
      ),
    );
    return listTitles;
  }
}

class _WorkoutsProgress {
  _WorkoutsProgress(this.day, this.progress);

  final String day;
  final double progress;
}
