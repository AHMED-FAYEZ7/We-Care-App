// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class DoctorWidget extends StatelessWidget {
  DoctorWidget({
    required this.doctorImage,
    required this.doctorName,
    required this.doctorSpecialist,
    Key? key,
  }) : super(key: key);

  String doctorImage;
  String doctorName;
  String doctorSpecialist;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .95,
      height: AppSize.s100,
      child: Card(
        elevation: AppSize.s0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
          side: const BorderSide(color: Colors.grey, width: AppSize.s1),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),
              child: Image.asset(
                doctorImage,
                fit: BoxFit.fill,
                width: AppSize.s100,
                height: AppSize.s100,
              ),
            ),
            const SizedBox(
              width: AppSize.s10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .46,
              height: AppSize.s100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorManager.black,
                      fontSize: AppSize.s12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  Row(
                    children: [
                      Icon(
                        IconBroken.Star,
                        color: ColorManager.primary,
                        size: AppSize.s16,
                      ),
                      Text(
                        "4.7(4692 reviews)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorManager.black,
                          fontSize: AppSize.s10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  Text(
                    "$doctorSpecialist Specialist - Ramsay College Hospital",
                    maxLines: 2,
                    style: TextStyle(
                      color: ColorManager.black,
                      fontSize: AppSize.s10,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: AppSize.s8,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                IconBroken.Heart,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
