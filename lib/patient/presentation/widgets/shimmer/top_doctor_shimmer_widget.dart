// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/patient/presentation/widgets/shimmer/shimmer_widget.dart';

class TopDoctorShimmerWidget extends StatelessWidget {
  TopDoctorShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s140,
      height: AppSize.s180,
      child: Card(
        elevation: AppSize.s3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        child: Column(
          children: const [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppSize.s12),
                topLeft: Radius.circular(AppSize.s12),
              ),
              child: ShimmerWidget(
                width: AppSize.s150,
                height: AppSize.s120,
              ),
            ),
            SizedBox(
              height: AppSize.s8,
            ),
            ShimmerWidget(
              width: double.infinity,
              height: AppSize.s15,
            ),
            SizedBox(
              height: AppSize.s5,
            ),
            ShimmerWidget(
              width: double.infinity,
              height: AppSize.s15,
            ),
          ],
        ),
      ),
    );
  }
}
