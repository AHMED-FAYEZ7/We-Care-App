// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class ToggleWidget extends StatelessWidget {
  ToggleWidget({
    required this.firstText,
    required this.secondText,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  String firstText;
  String secondText;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: AppSize.s250,
        height: AppSize.s250,
        child: Card(
          elevation: AppSize.s4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
            // side: const BorderSide(color: Colors.grey, width: AppSize.s1),
          ),
          child: InkWell(
            onTap: onTap,
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: AppSize.s100,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.primary, // Default color for the text
                    ),
                    children: [
                      TextSpan(
                        text: firstText,
                      ),
                      TextSpan(
                        text: secondText,
                        style: TextStyle(
                          fontSize: AppSize.s50,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.black,
                        ), // Blue color for "Dr. Leo Messi"
                      ),
                    ],
                  ),
                ),
                const Icon(
                  IconBroken.Arrow___Right,
                  size: AppSize.s120,
                ),
              ],
            ),
          ),
        ));
  }
}
