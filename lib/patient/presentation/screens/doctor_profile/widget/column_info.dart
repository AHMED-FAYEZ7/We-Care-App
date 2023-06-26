// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class ColumnInfoWidget extends StatelessWidget {
  ColumnInfoWidget({
    required this.icon,
    required this.number,
    required this.subTitle,
    Key? key,
  }) : super(key: key);

  IconData icon;
  int number;
  String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          size: 29,
        ),
        Text(
          "$number+",
          style: TextStyle(
            color: ColorManager.primary,
          ),
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
