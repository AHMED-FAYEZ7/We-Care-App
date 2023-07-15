// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/patient/domain/model/rarte_model.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';
import 'package:health_care/patient/presentation/screens/reviews/widget/patient_rate_widget.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/empty_list_widget.dart';
import 'package:health_care/patient/presentation/widgets/shimmer/doctor_shimmer_widget.dart';

class ReviewsScreen extends StatelessWidget {
  ReviewsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PatientCubit.get(context);
        return Scaffold(
          appBar: AppBarWidget(
            isBack: true,
            title: "Reviews",
          ),
          body: Column(
            children: [
              Expanded(
                child: ConditionalBuilder(
                  condition: state is! GetDoctorRateLoadingState,
                  builder: (context) =>
                  cubit.rateList.isNotEmpty
                      ? ListView.separated(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p12,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) =>
                        PatientRateWidget(
                          model: cubit.rateList[index],
                        ),
                    separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      width: AppSize.s10,
                    ),
                    itemCount: cubit.rateList.length,
                  )
                      : EmptyListWidget(text: 'No Reviews Yet'),
                  fallback: (context) => DoctorShimmerWidget(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
