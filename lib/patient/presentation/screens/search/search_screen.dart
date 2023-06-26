// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/patient/presentation/widgets/doctor_widget.dart';
import 'package:health_care/patient/presentation/widgets/pop_navigator_app_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/specialist_doctor_list_widget.dart';

class SearchPatientScreen extends StatefulWidget {
  const SearchPatientScreen({Key? key}) : super(key: key);

  @override
  State<SearchPatientScreen> createState() => _SearchPatientScreenState();
}

class _SearchPatientScreenState extends State<SearchPatientScreen> {
  List<String> specialist = [
    "All",
    "Brain",
    "Cardio",
    "Eye",
    "All",
    "Brain",
    "Cardio",
    "Eye"
  ];

  int selectedSpecialistIndex = 0;

  void selectSpecialist(int index) {
    setState(() {
      selectedSpecialistIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PopNavigatorAppBarWidget(
            isSearch: true,
          ),
          const SpecialistDoctorListWidget(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
              ),
              scrollDirection: Axis.vertical,
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
