import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/user_update_password_usecase.dart';
import 'package:health_care/core/services/services_locator.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  final UserUpdatePasswordUseCase _userUpdatePasswordUseCase =
      sl<UserUpdatePasswordUseCase>();

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
              (await _userUpdatePasswordUseCase
                      .call(UserUpdatePasswordUseCaseInput(
                '1234',
                '123',
                '123',
              )))
                  .fold(
                (failure) {
                  print(failure.message.toString());
                },
                (data) {
                  print(data.token.toString());
                },
              );
            },
            child: const Text(
              "Login Callllll",
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
