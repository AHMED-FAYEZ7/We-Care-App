import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/user_delete_me_usecse.dart';
import 'package:health_care/core/services/services_locator.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  final UserDeleteMeUseCase _userDeleteMeUseCase = sl<UserDeleteMeUseCase>();

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
              (await _userDeleteMeUseCase.call().then((value) {
                print(value.message.toString());
              }));
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
