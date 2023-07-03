// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/patient/domain/model/rarte_model.dart';
import 'package:health_care/patient/presentation/screens/reviews/widget/patient_rate_widget.dart';
import 'package:health_care/patient/presentation/widgets/app_bar_widget.dart';

class ReviewsScreen extends StatelessWidget {
  ReviewsScreen({
    required this.reviews,
    Key? key,
  }) : super(key: key);

  List<Rate> reviews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
        title: "Reviews",
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
              ),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) =>
                  PatientRateWidget(
                model: reviews[index],
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: AppSize.s10,
              ),
              itemCount: reviews.length,
            ),
          ),
        ],
      ),
    );
  }
}
