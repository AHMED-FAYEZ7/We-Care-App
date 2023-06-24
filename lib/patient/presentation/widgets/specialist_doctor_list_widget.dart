// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class SpecialistDoctorListWidget extends StatefulWidget {
  const SpecialistDoctorListWidget({Key? key}) : super(key: key);

  @override
  State<SpecialistDoctorListWidget> createState() =>
      _SpecialistDoctorListWidgetState();
}

class _SpecialistDoctorListWidgetState
    extends State<SpecialistDoctorListWidget> {
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p12,
          ),
          child: Container(
            height: AppSize.s30,
            margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
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
      ],
    );
  }
}
