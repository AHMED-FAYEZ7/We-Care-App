// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/doctor_sinup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/patient_signup_usecase.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/assets/app_assets.dart';

import '../../../../core/services/services_locator.dart';

class OnBoardingScreen extends StatelessWidget {
  PatientSignUpUseCase useCase = sl<PatientSignUpUseCase>();
  DoctorSignUpUseCase doctor = sl<DoctorSignUpUseCase>();
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("OnBoardingScreen"),
          ),
          TextButton(
            onPressed: () {
              _appPreferences.setOnBoardingScreenViewed();
            },
            child: const Text("to Toggle"),
          ),
        ],
      ),
    );
  }
}
