import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMargin {
  static const double m6 = 6.0;
  static const double m8 = 8.0;
  static const double m10 = 10.0;
  static const double m12 = 12.0;
  static const double m14 = 14.0;
  static const double m16 = 16.0;
  static const double m18 = 18.0;
  static const double m20 = 20.0;
  static const double m22 = 22.0;
  static const double m24 = 24.0;
  static const double m26 = 26.0;
  static const double m28 = 28.0;
  static const double m30 = 30.0;
  static const double m32 = 32.0;
}

class AppPadding {
  static const double p0 = 0.0;
  static const double p5 = 5.0;
  static const double p6 = 6.0;
  static const double p8 = 8.0;
  static const double p10 = 10.0;
  static const double p12 = 12.0;
  static const double p14 = 14.0;
  static const double p16 = 16.0;
  static const double p18 = 18.0;
  static const double p20 = 20.0;
  static const double p22 = 22.0;
  static const double p24 = 24.0;
  static const double p26 = 26.0;
  static const double p28 = 28.0;
  static const double p30 = 30.0;
  static const double p32 = 32.0;
  static const double p50 = 50.0;
  static const double p80 = 80.0;
  static const double p100 = 100.0;
}

class AppSize {
  static const double s0 = 0;
  static const double s1 = 1;

  static const double s1_5 = 1.5;

  static const double s2 = 2;
  static const double s3 = 3;
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s24 = 24.0;
  static const double s25 = 25.0;
  static const double s26 = 26.0;
  static const double s28 = 28.0;
  static const double s29 = 29.0;
  static const double s30 = 30.0;
  static const double s32 = 32.0;
  static const double s36 = 36.0;
  static const double s40 = 40.0;
  static const double s45 = 45.0;
  static const double s54 = 54.0;
  static const double s50 = 50.0;
  static const double s60 = 60.0;
  static const double s70 = 70.0;
  static const double s75 = 75.0;
  static const double s80 = 80.0;
  static const double s99 = 99.0;
  static const double s90 = 90.0;
  static const double s100 = 100.0;
  static const double s120 = 120.0;
  static const double s130 = 130.0;
  static const double s140 = 140.0;
  static const double s141 = 141.0;
  static const double s150 = 150.0;
  static const double s160 = 160.0;
  static const double s169 = 169.0;
  static const double s180 = 180.0;
  static const double s190 = 190.0;
  static const double s200 = 200.0;
  static const double s236_49 = 236.49;
  static const double s243_56 = 243.56;
  static const double s250 = 250.0;
  static const double s258 = 258.0;
  static const double s290 = 290.0;
  static const double s308_03 = 308.03;
  static const double s315 = 315.0;
  static const double s326 = 326.0;
  static const double s350 = 350.0;
  static const double s400 = 400.0;
  static const double s430 = 430.0;
}

class AppMultipliedSize {
  static const double sizeOfSmallContainer = 70 * 0.8;

  double multipliedSizeX1_2(double size) {
    return size * 1.2;
  }
}

class AppCounts {
  static const int c1 = 1;
  static const int c2 = 2;
  static const int c3 = 3;
  static const int c4 = 4;
}

class AppElevation {
  static const double e0 = 0.0;
  static const double e1 = 1.0;
  static const double e1_5 = 1.5;
  static const double e2 = 2.0;
}

class ConstEdgeInsetsGeometry {
  static EdgeInsetsGeometry defaultPaddingAuth = EdgeInsets.only(
      top: AppPadding.p50.h, right: AppPadding.p30.w, left: AppPadding.p30.w);

  static EdgeInsetsGeometry defaultPaddingWorkoutScreens = EdgeInsets.symmetric(
      horizontal: AppPadding.p24.w, vertical: AppPadding.p32.h);

  static EdgeInsetsGeometry defaultPaddingHomeScreen =
      EdgeInsets.only(right: AppPadding.p30.w, left: AppPadding.p30.w);
}
