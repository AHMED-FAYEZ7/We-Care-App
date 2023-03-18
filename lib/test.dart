import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/user_update_info_usecase.dart';
import 'package:health_care/core/services/services_locator.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  final UserUpdateInfoUseCase _userUpdateInfoUseCase =
      sl<UserUpdateInfoUseCase>();

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
              (await _userUpdateInfoUseCase.call(
                UserUpdateInfoUseCaseInput(
                  true,
                  "fazo",
                  "fezo44",
                  "zzz@gmail.com",
                ),
              ))
                  .fold((l) {
                print(l.message.toString());
              }, (r) {
                print(r.data!.user!.name);
                print(r.data!.user!.userName);
              });
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
