import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      icon: AppIcons.notificationsNoneOutlined,
    );
  }

  Widget _buildIntroText(BuildContext context) {
    TextTheme themeTextStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.welcomeBack,
          style: themeTextStyle.titleSmall!.copyWith(
            color: AppColors.grey2,
          ),
        ),
        Text(
          AppStrings.userName,
          style: themeTextStyle.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildWorkoutProgressChart(BuildContext context) {
    TextTheme themeTextStyle = Theme.of(context).textTheme;
    return SfCartesianChart(
      margin: EdgeInsets.only(top: AppMargin.m8.h),
      plotAreaBorderWidth: AppSize.s0.w,
      title: ChartTitle(
        text: AppStrings.workoutProgress,
        textStyle: themeTextStyle.headlineLarge!
            .copyWith(color: AppColors.title, fontSize: AppSize.s14.sp),
        alignment: ChartAlignment.near,
      ),
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        labelAlignment: LabelAlignment.center,
        labelFormat: '{value}%',
        ///////////////Try edit when running the app///////////////////////
        minimum: 0,
        maximum: 100,
        interval: 20,
        //////////////////////////////////////////////////////////////////
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
          color: AppColors.lightPink,
          width: AppSize.s3.w,
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
              buttonPosition.dx.w,
              buttonPosition.dy.h + button.size.height.h,
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s50.r)),
            ),
            padding: EdgeInsets.all(AppPadding.p0.r),
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: AppLinearGradientColors.mainGradientColor,
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s50.r)),
            ),
            child: Column(
              children: [
                Container(
                  width: AppSize.s80.w,
                  height: AppSize.s30.h,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _selectedValue ?? AppStrings.weekly,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: AppFontSize.s10.sp,
                            color: AppColors.white),
                      ),
                      const Icon(AppIcons.arrowDropDown),
                    ],
                  ),
                ),
              ],
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
    TextTheme themeTextStyle = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.latestWorkout,
          style: themeTextStyle.headlineLarge!.copyWith(color: AppColors.title),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s16.r))),
            overlayColor: MaterialStateProperty.all(AppColors.lightPrimary),
          ),
          child: Text(
            AppStrings.seeMore,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    );
  }

  Widget _buildListOfLatestWorkouts(BuildContext context) {
    return Flexible(
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
            leading: SizedBox(
              width: AppSize.s50.w,
              height: AppSize.s50.h,
              child: const CircleAvatar(
                backgroundColor: AppColors.backGroundCircleAvatar,
                backgroundImage: AssetImage(AppImagesPng.absWorkoutIcon),
              ),
            ),
            trailing: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return AppLinearGradientColors.circleIcon.createShader(bounds);
              },
              child: Icon(
                AppIcons.circleOutlined,
                size: AppSize.s28.r,
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
            leading: SizedBox(
              width: AppSize.s50.w,
              height: AppSize.s50.h,
              child: const CircleAvatar(
                backgroundColor: AppColors.backGroundCircleAvatar,
                backgroundImage: AssetImage(AppImagesPng.lowerWorkoutIcon),
              ),
            ),
            trailing: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return AppLinearGradientColors.circleIcon.createShader(bounds);
              },
              child: Icon(
                AppIcons.circleOutlined,
                size: AppSize.s28.r,
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
            leading: SizedBox(
              width: AppSize.s50.w,
              height: AppSize.s50.h,
              child: const CircleAvatar(
                backgroundColor: AppColors.backGroundCircleAvatar,
                backgroundImage: AssetImage(AppImagesPng.absWorkoutIcon),
              ),
            ),
            trailing: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return AppLinearGradientColors.circleIcon.createShader(bounds);
              },
              child: Icon(
                AppIcons.circleOutlined,
                size: AppSize.s28.r,
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
            leading: SizedBox(
              width: AppSize.s50.w,
              height: AppSize.s50.h,
              child: const CircleAvatar(
                backgroundColor: AppColors.backGroundCircleAvatar,
                backgroundImage: AssetImage(AppImagesPng.absWorkoutIcon),
              ),
            ),
            trailing: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return AppLinearGradientColors.circleIcon.createShader(bounds);
              },
              child: Icon(
                AppIcons.circleOutlined,
                size: AppSize.s28.r,
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
    double mediaQuerySizeOfHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: ConstEdgeInsetsGeometry.defaultPaddingHomeScreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildIntroText(context),
            SizedBox(height: mediaQuerySizeOfHeight / 25),
            _buildButtonAndProgressChart(context),
            SizedBox(height: mediaQuerySizeOfHeight / 50),
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
