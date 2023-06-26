import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/patient/presentation/widgets/doctor_widget.dart';
import 'package:health_care/patient/presentation/widgets/pop_navigator_app_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/specialist_doctor_list_widget.dart';

class TopDoctorPatientScreen extends StatelessWidget {
  const TopDoctorPatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PopNavigatorAppBarWidget(
            title: 'Top Doctor',
          ),
          const SpecialistDoctorListWidget(),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
              ),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => DoctorWidget(
                doctorImage: 'assets/images/me1.jpg',
                doctorName: 'Dr. Ahmed Fayez',
                doctorSpecialist: "Dental",
              ),
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
  }
}
