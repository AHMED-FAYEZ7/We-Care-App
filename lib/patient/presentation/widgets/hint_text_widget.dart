// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class HintTextWidget extends StatelessWidget {
  HintTextWidget({required this.title, required this.seeAll, Key? key})
      : super(key: key);

  String title;
  VoidCallback seeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Spacer(),
          TextButton(
            onPressed: seeAll,
            child: Text(
              'See all',
              style: TextStyle(
                color: ColorManager.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
