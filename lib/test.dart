import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/user_login_usecase.dart';
import 'package:health_care/core/services/services_locator.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  final UserLoginUseCase _patientSignUpUseCase = sl<UserLoginUseCase>();

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
                UserLoginUseCaseInput(
                  "doc1@gmail.com",
                  "55555",
                ),
              ))
                  .fold((l) {
                print(l.message.toString());
              }, (r) {
                print(r.user!.email);
                print(r.user!.scheduleTiming[0].start);
                print(r.user!.scheduleTiming[0].end);
                print(r.user!.scheduleTiming[0].id);
                print(r.user!.timePerPatient);
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
