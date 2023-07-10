// ignore_for_file: avoid_print, must_be_immutable

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

class SearchPatientScreen extends StatefulWidget {
  SearchPatientScreen({
    this.specialist,
    this.keyword,
    Key? key,
  }) : super(key: key);

  String? specialist;
  String? keyword;
  TextEditingController? controller = TextEditingController();

  @override
  State<SearchPatientScreen> createState() => _SearchPatientScreenState();
}

class _SearchPatientScreenState extends State<SearchPatientScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PatientCubit.get(context);

        handleSpecialistSelected({String? specialist}) {
          widget.specialist = specialist;
          if (specialist == 'All') {
            cubit.getSearchedDoctor(
              keyword: widget.controller!.text,
            );
          } else {
            cubit.getSearchedDoctor(
              keyword: widget.controller!.text,
              specialist: specialist,
            );
          }
        }

        handleKeyword() {
          if (widget.specialist == 'All') {
            cubit.getSearchedDoctor(
              keyword: widget.controller!.text,
            );
          } else {
            cubit.getSearchedDoctor(
              keyword: widget.controller!.text,
              specialist: widget.specialist,
            );
          }
        }

        return Scaffold(
          appBar: AppBarWidget(
            isBack: true,
            isSearch: true,
            controller: widget.controller,
            onSearch: handleKeyword,
          ),
          body: Column(
            children: [
              SpecialistDoctorListWidget(
                onSpecialistSelected: handleSpecialistSelected,
              ),
              Expanded(
                child: ConditionalBuilder(
                  condition: !cubit.isSearched,
                  builder: (context) => ListView.separated(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p12,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.doctorProfilePatientRoute,
                          arguments: cubit.allDoctor[index],
                        );
                      },
                      child: DoctorWidget(
                        model: cubit.allDoctor[index],
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      width: AppSize.s10,
                    ),
                    itemCount: cubit.allDoctor.length,
                  ),
                  fallback: (context) => state is! GetSearchedDoctorLoadingState
                      ? ConditionalBuilder(
                          condition: cubit.searchedDoctor.isNotEmpty,
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
                                  arguments: cubit.searchedDoctor[index],
                                );
                              },
                              child: DoctorWidget(
                                model: cubit.searchedDoctor[index],
                              ),
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              width: AppSize.s10,
                            ),
                            itemCount: cubit.searchedDoctor.length,
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
