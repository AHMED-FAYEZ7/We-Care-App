import 'package:flutter/material.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: ColorManager.primary,
    );
  }
}
