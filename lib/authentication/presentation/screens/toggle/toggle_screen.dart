import 'package:flutter/material.dart';
import 'package:health_care/core/routes/app_routes.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Toggle Screen"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.userLoginRoute);
            },
            child: const Text("to doctor"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.userLoginRoute);
            },
            child: const Text("to patient"),
          ),
        ],
      ),
    );
  }
}
