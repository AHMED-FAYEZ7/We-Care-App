import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class TopDoctorCardWidget extends StatelessWidget {
  TopDoctorCardWidget({
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
    return Container(
      width: AppSize.s140,
      height: AppSize.s180,
      child: Card(
        elevation: AppSize.s0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
          side: BorderSide(color: Colors.grey, width: AppSize.s1),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppSize.s12),
                topLeft: Radius.circular(AppSize.s12),
              ),
              child: Image.asset(
                doctorImage,
                fit: BoxFit.fill,
                width: AppSize.s150,
                height: AppSize.s120,
              ),
            ),
            const SizedBox(
              height: AppSize.s8,
            ),
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
            Text(
              "$doctorSpecialist Specialist",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorManager.black,
                fontSize: AppSize.s10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
