import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/doctor_sinup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/patient_signup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/user_login_usecase.dart';
import 'package:health_care/core/services/services_locator.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  final DoctorSignUpUseCase _patientSignUpUseCase = sl<DoctorSignUpUseCase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          TextButton(
            onPressed: () async {
              (await _patientSignUpUseCase.call(
                DoctorSignUpUseCaseInput(
                  "doc3@gmail.com",
                  "doc3",
                  "55555",
                  "55555",
                  "Gynecologist",
                ),
              ))
                  .fold((l) {
                print(l.message.toString());
              }, (r) {
                print(r.user!.email);
                print(r.user!.specialization);
                print(r.user!.numberOfRating);
                print(r.user!.status);
              });
            },
            child: const Text(
              "Login Call",
            ),
          ),
          // TextButton(
          //   onPressed: () {
          //     _userLoginUseCase.;
          //   },
          //   child: const Text(
          //     "fold",
          //   ),
          // ),
        ],
      ),
    );
  }
}
