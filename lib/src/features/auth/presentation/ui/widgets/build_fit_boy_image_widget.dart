import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class BuildFitBoyImage extends StatelessWidget {
  const BuildFitBoyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImagesPng.fitBoy3,
    );
  }
}
