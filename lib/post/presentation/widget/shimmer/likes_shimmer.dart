// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/patient/presentation/widgets/shimmer/shimmer_widget.dart';

class LikesShimmerWidget extends StatelessWidget {
  LikesShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
      ),
      itemBuilder: (context, index) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: ShimmerWidget(
              width: AppSize.s50,
              height: AppSize.s50,
            ),
          ),
          const SizedBox(
            width: AppSize.s5,
          ),
          Card(
            elevation: AppSize.s3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
            child: ShimmerWidget(
              width: MediaQuery.of(context).size.width * .7,
              height: AppSize.s30,
            ),
          ),
        ],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSize.s15,
      ),
      itemCount: 15,
    );
  }
}
