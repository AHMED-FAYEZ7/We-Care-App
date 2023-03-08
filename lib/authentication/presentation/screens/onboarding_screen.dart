import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/patient_signup_usecase.dart';

import '../../../core/services/services_locator.dart';

class OnBoardingScreen extends StatelessWidget {
  PatientSignUpUseCase useCase = sl<PatientSignUpUseCase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              (await useCase.call(PatientSignUpUseCaseInput(
                "fff",
                "ssff",
                "opp88dd@gmail.com",
                "ssff",
              )))
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
            onPressed: () {
              // print(PatientAuth);
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
