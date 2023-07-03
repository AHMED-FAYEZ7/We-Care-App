// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/patient/presentation/widgets/shimmer/shimmer_widget.dart';

class DoctorShimmerWidget extends StatelessWidget {
  DoctorShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
      ),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => SizedBox(
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
              const ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s12),
                  bottomLeft: Radius.circular(AppSize.s12),
                ),
                child: ShimmerWidget(
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
                  children: const [
                    ShimmerWidget(
                      width: double.infinity,
                      height: AppSize.s10,
                    ),
                    SizedBox(
                      height: AppSize.s8,
                    ),
                    ShimmerWidget(
                      width: double.infinity,
                      height: AppSize.s10,
                    ),
                    SizedBox(
                      height: AppSize.s8,
                    ),
                    ShimmerWidget(
                      width: double.infinity,
                      height: AppSize.s10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: AppSize.s10,
      ),
      itemCount: 10,
    );
  }
}
