import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/patient/presentation/widgets/rate_widget.dart';

class TopDoctorCardWidget extends StatelessWidget {
  TopDoctorCardWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  final User model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: AppSize.s140,
        child: Card(
          elevation: AppSize.s3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(AppSize.s12),
                  topLeft: Radius.circular(AppSize.s12),
                ),
                child: Image.network(
                  "https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg",
                  fit: BoxFit.cover,
                  width: AppSize.s150,
                  height: AppSize.s120,
                ),
              ),
              const SizedBox(
                height: AppSize.s8,
              ),
              Text(
                model.name,
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
                "${model.specialization} Specialist",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorManager.black,
                  fontSize: AppSize.s10,
                ),
              ),
              const SizedBox(
                height: AppSize.s5,
              ),
              RateWidget(
                ignoreGestures: true,
                rate: model.averageRating,
              ),
            ],
          ),
        ));
  }
}
