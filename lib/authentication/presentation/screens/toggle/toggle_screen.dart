import 'package:flutter/material.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/patient/presentation/widgets/app_bar_widget.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(isBack:  true,title: '',),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Toggle Screen"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.doctorRegisterRoute);
            },
            child: const Text("to doctor"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.patientRegisterRoute);
            },
            child: const Text("to patient"),
          ),
        ],
      ),
    );
  }
}
