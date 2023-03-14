import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/user_login_usecase.dart';
import 'package:health_care/core/services/services_locator.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  final UserLoginUseCase _userLoginUseCase = sl<UserLoginUseCase>();

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
              (await _userLoginUseCase.call(UserLoginUseCaseInput(
                'ralofac165@wwgoc.com',
                '123',
              )))
                  .fold(
                (failure) {
                  print(failure.message.toString());
                },
                (data) {
                  print(data.data!.user!.name);
                  print(data.data!.user!.type);
                  print(data.token);
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
