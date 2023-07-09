import 'package:flutter/material.dart';
import 'package:health_care/authentication/presentation/screens/toggle/widget/toggle_widget.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/patient/presentation/widgets/app_bar_widget.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
        title: '',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleWidget(
              firstText: 'D',
              secondText: 'octor',
              onTap: () {
                Navigator.pushNamed(context, Routes.doctorRegisterRoute);
              },
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
            ToggleWidget(
              firstText: 'P',
              secondText: 'atient',
              onTap: () {
                Navigator.pushNamed(context, Routes.patientRegisterRoute);
              },
            ),
            // const Center(
            //   child: Text("Toggle Screen"),
            // ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, Routes.doctorRegisterRoute);
            //   },
            //   child: const Text("to doctor"),
            // ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, Routes.patientRegisterRoute);
            //   },
            //   child: const Text("to patient"),
            // ),
          ],
        ),
      ),
    );
  }
}
