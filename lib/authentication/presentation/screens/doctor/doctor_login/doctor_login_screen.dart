import 'package:flutter/material.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/services/services_locator.dart';

class DoctorLoginScreen extends StatelessWidget {
  DoctorLoginScreen({Key? key}) : super(key: key);

  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("DoctorLoginScreen"),
          ),
          TextButton(
            onPressed: () {
              _appPreferences.setIsDoctorLoggedIn();
            },
            child: const Text("to Toggle"),
          ),
        ],
      ),
    );
  }
}
