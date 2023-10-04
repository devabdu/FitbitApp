import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientIcon extends StatelessWidget {
  GradientIcon(this.icon, this.size, this.gradient, {super.key});

  final IconData icon;
  final double size;
  final Gradient gradient;
  final AppMultipliedSize _appMultipliedSize = AppMultipliedSize();

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: _appMultipliedSize.multipliedSizeX1_2(size).w,
        height: _appMultipliedSize.multipliedSizeX1_2(size).h,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}
