import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';
import 'package:health_care/patient/presentation/widgets/app_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/doctor_widget.dart';
import 'package:health_care/patient/presentation/widgets/specialist_doctor_list_widget.dart';

class TopDoctorPatientScreen extends StatelessWidget {
  const TopDoctorPatientScreen({Key? key}) : super(key: key);

  void handleSpecialistSelected(String selectedValue) {
    print(selectedValue);
  }

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
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p12,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) =>
                      DoctorWidget(
                    model: cubit.topDoctor[index],
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: AppSize.s10,
                  ),
                  itemCount: cubit.topDoctor.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}