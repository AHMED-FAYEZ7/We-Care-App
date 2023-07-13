// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/patient/presentation/widgets/rate_widget.dart';

class DoctorWidget extends StatelessWidget {
  DoctorWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  User model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .95,
      height: AppSize.s100,
      child: Card(
        elevation: AppSize.s3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/3774/3774299.png",
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
                    model.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorManager.black,
                      fontSize: AppSize.s14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  Row(
                    children: [
                      RateWidget(
                        ignoreGestures: true,
                        rate: model.averageRating,
                      ),
                      Text(
                        "(${model.numberOfRating} reviews)",
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
                    "${model.specialization} Specialist - Ramsay College Hospital",
                    maxLines: 2,
                    style: TextStyle(
                      color: ColorManager.black,
                      fontSize: AppSize.s10,
                    ),
                  ),
                ],
              ),
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
