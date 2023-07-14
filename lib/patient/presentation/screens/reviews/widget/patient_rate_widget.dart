// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/core/assets/app_assets.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/patient/domain/model/rarte_model.dart';
import 'package:health_care/patient/presentation/widgets/rate_widget.dart';
import 'package:intl/intl.dart';

class PatientRateWidget extends StatelessWidget {
  PatientRateWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  Rate model;

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
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s12),
                    bottomLeft: Radius.circular(AppSize.s12),
                  ),
                  child: Image.network(
                    model.patient!.profilePicture,
                    fit: BoxFit.cover,
                    width: AppSize.s100,
                    height: AppSize.s100,
                  ),
                ),
                const SizedBox(
                  width: AppSize.s10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  height: AppSize.s100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.patient!.name,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ColorManager.black,
                          fontSize: AppSize.s14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s5,
                      ),
                      Text(
                        DateFormat.yMMMMd('en_US')
                            .format(DateTime.parse(model.createdAt)),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorManager.black,
                          fontSize: AppSize.s12,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s5,
                      ),
                      Text(
                        model.comment,
                        maxLines: 2,
                        style: TextStyle(
                          color: ColorManager.black,
                          fontSize: AppSize.s14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RateWidget(
              ignoreGestures: true,
              rate: model.rating.toDouble(),
            ),
          ],
        ),
      ),
    );
  }
}
