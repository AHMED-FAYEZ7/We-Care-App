// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/patient/presentation/widgets/shimmer/shimmer_widget.dart';

class PostsShimmerWidget extends StatelessWidget {
  PostsShimmerWidget({
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
      itemBuilder: (BuildContext context, int index) => Card(
        elevation: AppSize.s3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: ShimmerWidget(
                      width: AppSize.s50,
                      height: AppSize.s50,
                    ),
                  ),
                  const SizedBox(
                    width: AppSize.s8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerWidget(
                          height: AppSize.s8,
                          width: MediaQuery.of(context).size.width * .38,
                        ),
                        const SizedBox(
                          height: AppSize.s5,
                        ),
                        ShimmerWidget(
                          width: MediaQuery.of(context).size.width * .38,
                          height: AppSize.s8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              ShimmerWidget(
                height: AppSize.s10,
              ),
              const SizedBox(
                height: AppSize.s5,
                width: double.infinity,
              ),
              ShimmerWidget(
                height: AppSize.s12,
                width: double.infinity,
              ),
              const SizedBox(
                height: AppSize.s5,
              ),
              ShimmerWidget(
                height: AppSize.s12,
                width: double.infinity,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: ShimmerWidget(
                  height: AppSize.s150,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: AppSize.s5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 1,
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: ShimmerWidget(
                        height: AppSize.s20,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        ClipOval(
                          child: ShimmerWidget(
                            width: AppSize.s30,
                            height: AppSize.s30,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ShimmerWidget(
                          height: AppSize.s15,
                          width: MediaQuery.of(context).size.width * .3,
                        ),
                        Spacer(),
                        ShimmerWidget(
                          width: MediaQuery.of(context).size.width * .3,
                          height: AppSize.s15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: AppSize.s10,
      ),
      itemCount: 5,
    );
  }
}
