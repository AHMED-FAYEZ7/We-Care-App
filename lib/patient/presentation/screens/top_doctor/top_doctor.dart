import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/doctor_widget.dart';
import 'package:health_care/patient/presentation/widgets/empty_list_widget.dart';
import 'package:health_care/patient/presentation/widgets/shimmer/doctor_shimmer_widget.dart';
import 'package:health_care/patient/presentation/widgets/specialist_doctor_list_widget.dart';

class TopDoctorPatientScreen extends StatelessWidget {
  TopDoctorPatientScreen({Key? key}) : super(key: key);

  // void handleSpecialistSelected({String? selectedValue}) {
  //   print(selectedValue);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PatientCubit.get(context);
        return Scaffold(
          appBar: AppBarWidget(
            title: 'Top Doctor',
            isBack: true,
          ),
          body: Column(
            children: [
              SpecialistDoctorListWidget(
                onSpecialistSelected: cubit.getTopDoctor,
              ),
              Expanded(
                child: ConditionalBuilder(
                  condition: !cubit.isAllTop,
                  builder: (context) => state is! GetTopDoctorLoadingState
                      ? ListView.separated(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p12,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) =>
                              InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.doctorProfilePatientRoute,
                                arguments: cubit.topDoctor[index],
                              );
                            },
                            child: DoctorWidget(
                              model: cubit.topDoctor[index],
                            ),
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            width: AppSize.s10,
                          ),
                          itemCount: cubit.topDoctor.length,
                        )
                      : DoctorShimmerWidget(),
                  fallback: (context) => state is! GetTopDoctorLoadingState
                      ? ConditionalBuilder(
                          condition: cubit.specialistTopDoctor.isNotEmpty,
                          builder: (context) => ListView.separated(
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p12,
                            ),
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.doctorProfilePatientRoute,
                                  arguments: cubit.specialistTopDoctor[index],
                                );
                              },
                              child: DoctorWidget(
                                  model: cubit.specialistTopDoctor[index]),
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              width: AppSize.s10,
                            ),
                            itemCount: cubit.specialistTopDoctor.length,
                          ),
                          fallback: (context) => EmptyListWidget(
                            text: 'No Doctors Here',
                          ),
                        )
                      : DoctorShimmerWidget(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
