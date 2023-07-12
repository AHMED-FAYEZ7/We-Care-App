// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/patient/presentation/widgets/shimmer/shimmer_widget.dart';

class CommentsShimmerWidget extends StatelessWidget {
  CommentsShimmerWidget({
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
              width: AppSize.s150,
              height: AppSize.s40,
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
