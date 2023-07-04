// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class SpecialistDoctorListWidget extends StatefulWidget {
  SpecialistDoctorListWidget({
    // this.keyword,
    this.onSpecialistSelected,
    this.isAll = false,
    Key? key,
  }) : super(key: key);

  // String? keyword;
  Function({String? specialist})? onSpecialistSelected;
  bool isAll = false;
  @override
  State<SpecialistDoctorListWidget> createState() =>
      _SpecialistDoctorListWidgetState();
}

class _SpecialistDoctorListWidgetState
    extends State<SpecialistDoctorListWidget> {
  List<String> specialist = [
    "All",
    "Allergist",
    "Andrologist",
    "Anesthesiologist",
    "Audiologist",
    "Cardiologist",
    "Cardiothoracic Surgeon",
    "Dentist",
    "Dermatologist",
    "Endocrinologist",
    "ENT Doctor (Otolaryngologist)",
    "Family Doctor (General Practitioner)",
    "Gastroenterologist",
    "General Surgeon",
    "Gynecologist",
    "Hematologist",
    "Hepatologist",
    "Infertility Specialist",
    "Internist",
    "Laboratory",
    "Nephrologist",
    "Neurologist",
    "Neurosurgeon",
    "Nutritionist",
    "Obesity Surgeon",
    "Oncologist",
    "Ophthalmologist",
    "Orthopedist",
    "Pediatric Surgeon",
    "Pediatrician",
    "Phoniatrician",
    "Physiotherapist",
    "Plastic Surgeon",
    "Psychiatrist",
    "Pulmonologist",
    "Radiologist",
    "Rheumatologist",
    "Urologist",
    "Vascular Surgeon"
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
                  widget.onSpecialistSelected!(specialist: specialist[index]);
                  setState(() {
                    if (specialist[index] == 'All') {
                      widget.isAll = true;
                      print(widget.isAll.toString());
                    } else {
                      widget.isAll = false;
                      print(widget.isAll.toString());
                    }
                  });
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
