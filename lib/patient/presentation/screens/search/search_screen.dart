// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';
import 'package:health_care/patient/presentation/widgets/app_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/doctor_widget.dart';
import 'package:health_care/patient/presentation/widgets/shimmer/doctor_shimmer_widget.dart';
import 'package:health_care/patient/presentation/widgets/specialist_doctor_list_widget.dart';

class SearchPatientScreen extends StatefulWidget {
  SearchPatientScreen({
    this.specialist,
    Key? key,
  }) : super(key: key);

  String? specialist;
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

        TextEditingController? controller = TextEditingController();
        Function(String value)? onChanged;

        handleSpecialistSelected({String? specialist}) {
          widget.specialist = specialist;
          print(specialist);
          cubit.getSearchedDoctor(
              keyword: controller.text, specialist: specialist);
        }

        handleKeyword(String? keyword) {
          print(keyword);
          cubit.getSearchedDoctor(
            keyword: keyword,
            specialist: widget.specialist,
          );
        }

        return Scaffold(
          appBar: AppBarWidget(
            isBack: true,
            isSearch: true,
            controller: controller,
            // onChanged: handleKeyword(controller.text),
          ),
          body: Column(
            children: [
              SpecialistDoctorListWidget(
                onSpecialistSelected: handleSpecialistSelected,
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p12,
                  ),
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => Divider(),
                  //
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: AppSize.s10,
                  ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
