import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/assets/app_assets.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';
import 'package:health_care/patient/presentation/widgets/hint_text_widget.dart';
import 'package:health_care/patient/presentation/widgets/search_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/specialist_doctor_card_widget.dart';
import 'package:health_care/patient/presentation/widgets/top_doctor_card_widget.dart';
import 'package:health_care/patient/presentation/widgets/shimmer/top_doctor_shimmer_widget.dart';

class HomePatientScreen extends StatelessWidget {
  const HomePatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PatientCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SearchBarWidget(
                  readOnly: true,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.searchPatientRoute,
                    );
                  },
                ),
                const SizedBox(
                  height: AppSize.s5,
                ),
                HintTextWidget(
                  title: 'Specialist Doctor',
                  isSuffix: true,
                  onTapTitle: "See All",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.specialistDoctorPatientRoute,
                      arguments: context.read<PatientCubit>(),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p12,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .25,
                    margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          SpecialistDoctorCardWidget(
                        specialistImage: ImageAssets.splashLogo,
                        specialistName: 'heart',
                        specialistNoDoctors: 252,
                        specialistColor: ColorManager.error,
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: AppSize.s10,
                      ),
                      itemCount: 10,
                    ),
                  ),
                ),
                HintTextWidget(
                  title: 'Top Doctor',
                  isSuffix: true,
                  onTapTitle: "See All",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.topDoctorPatientRoute,
                      arguments: context.read<PatientCubit>(),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p12,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .25,
                    margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
                    child: ConditionalBuilder(
                      condition: cubit.topDoctor.isNotEmpty,
                      builder: (context) => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.doctorProfilePatientRoute,
                              arguments: cubit.topDoctor[index],
                            );
                          },
                          child: TopDoctorCardWidget(
                            model: cubit.topDoctor[index],
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          width: AppSize.s10,
                        ),
                        itemCount: cubit.topDoctor.length,
                      ),
                      fallback: (context) => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            TopDoctorShimmerWidget(),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          width: AppSize.s10,
                        ),
                        itemCount: 5,
                      ),
                    ),
                  ),
                ),
                HintTextWidget(
                  title: 'Recommendation',
                  isSuffix: true,
                  onTapTitle: "See All",
                  onTap: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p12,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .25,
                    margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
                    child: ConditionalBuilder(
                      condition: cubit.allDoctor.isNotEmpty,
                      builder: (context) => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            InkWell(
                          child: TopDoctorCardWidget(
                            model: cubit.allDoctor[index],
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.doctorProfilePatientRoute,
                              arguments: cubit.allDoctor[index],
                            );
                          },
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          width: AppSize.s10,
                        ),
                        itemCount: cubit.allDoctor.length,
                      ),
                      fallback: (context) => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            TopDoctorShimmerWidget(),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          width: AppSize.s10,
                        ),
                        itemCount: 5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
