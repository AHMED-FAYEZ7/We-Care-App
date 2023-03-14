import 'package:flutter/material.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/services/services_locator.dart';

class UserLoginScreen extends StatelessWidget {
  UserLoginScreen({Key? key}) : super(key: key);

  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("PatientLoginScreen"),
          ),
          TextButton(
            onPressed: () {
              _appPreferences.setIsPatientLoggedIn();
            },
            child: const Text("to Toggle"),
          ),
        ],
      ),
    );
  }
}
