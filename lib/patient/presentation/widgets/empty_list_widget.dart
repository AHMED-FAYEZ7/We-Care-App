import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class EmptyListWidget extends StatelessWidget {
   EmptyListWidget({required this.text,Key? key,}) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppSize.s20,
          color: ColorManager.grey,
        ),
      ),
    );
  }
}
