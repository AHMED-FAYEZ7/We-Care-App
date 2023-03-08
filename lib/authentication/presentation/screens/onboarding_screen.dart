// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/doctor_sinup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/patient_signup_usecase.dart';

import '../../../core/services/services_locator.dart';

class OnBoardingScreen extends StatelessWidget {
  PatientSignUpUseCase useCase = sl<PatientSignUpUseCase>();
  DoctorSignUpUseCase doctor = sl<DoctorSignUpUseCase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              (await useCase.call(
                PatientSignUpUseCaseInput(
                  "finalTest13@gmail.com",
                  "volt",
                  "123456",
                  "123456",
                ),
              ))
                  .fold(
                (failure) {
                  print("555555555${failure.message}");
                },
                (data) {
                  print("66666666666666${data.token}");
                  print(data.data!.user!.email);
                },
              );
            },
            child: const Text(
              'click',
              style: TextStyle(fontSize: 40),
            ),
          ),
          TextButton(
            onPressed: () async {
              (await doctor.call(
                DoctorSignUpUseCaseInput(
                  "finalTest135@gmail.com",
                  "volt",
                  "123456",
                  "123456",
                  "gamed",
                ),
              ))
                  .fold(
                (failure) {
                  print("555555555${failure.message}");
                },
                (data) {
                  print("66666666666666${data.token}");
                  print(data.data!.user!.email);
                },
              );
            },
            child: const Text(
              'click',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ],
      ),
    );
  }
}
