import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/user_forget_password_usecase.dart';
import 'package:health_care/core/services/services_locator.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  final UserForgetPasswordUseCase _userForgetPasswordUseCase =
      sl<UserForgetPasswordUseCase>();

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
              (await _userForgetPasswordUseCase.call(
                'ralofac165@wwgoc.com',
              ))
                  .fold(
                (failure) {
                  print(failure.message.toString());
                },
                (data) {
                  print(data.message.toString());
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
