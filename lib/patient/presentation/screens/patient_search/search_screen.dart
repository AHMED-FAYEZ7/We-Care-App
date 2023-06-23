// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/patient/presentation/widgets/doctor_widget.dart';
import 'package:health_care/patient/presentation/widgets/search_bar_widget.dart';

class PatientSearchScreen extends StatefulWidget {
  const PatientSearchScreen({Key? key}) : super(key: key);

  @override
  State<PatientSearchScreen> createState() => _PatientSearchScreenState();
}

class _PatientSearchScreenState extends State<PatientSearchScreen> {
  bool isInit = false;

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
          SizedBox(
            height: MediaQuery.of(context).size.width * .15,
          ),
          Row(children: [
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, Routes.patientLayoutRoute);
              },
              icon: const Icon(
                IconBroken.Arrow___Left,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .866,
              child: SearchBarWidget(
                readOnly: false,
                initialValue: "Dr. ",
                onTap: () {},
              ),
            ),
          ]),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p12,
            ),
            child: Container(
              height: AppSize.s30,
              margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    selectSpecialist(index);
                    print(specialist[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedSpecialistIndex == index
                          ? ColorManager.primary
                          : ColorManager.white,
                      borderRadius: BorderRadius.circular(AppSize.s10),
                      border: Border.all(
                        color: ColorManager.primary,
                        style: BorderStyle.solid,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p5),
                      child: Text(
                        specialist[index],
                        style: TextStyle(
                          fontSize: 14,
                          color: selectedSpecialistIndex == index
                              ? ColorManager.white
                              : ColorManager.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: AppSize.s10,
                ),
                itemCount: specialist.length,
              ),
            ),
          ),
          const SizedBox(height: 8),
          DoctorWidget(
            doctorImage: 'assets/images/me1.jpg',
            doctorName: 'Dr. Ahmed Fayez',
            doctorSpecialist: "Dental",
          ),
        ],
      ),
    );
  }
}
