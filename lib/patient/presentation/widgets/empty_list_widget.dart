import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No Doctors Here',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppSize.s20,
          color: ColorManager.grey,
        ),
      ),
    );
  }
}
