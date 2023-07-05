import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/patient/presentation/screens/appointment/widget/appointment_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AppointmentPatientScreen extends StatelessWidget {
  const AppointmentPatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: ToggleSwitch(
              minWidth: AppSize.s150,
              cornerRadius: 20.0,
              borderWidth: 1,
              borderColor: [ColorManager.primary],
              activeBgColors: [
                [ColorManager.primary],
                [ColorManager.primary],
              ],
              activeFgColor: ColorManager.white,
              inactiveBgColor: ColorManager.white,
              inactiveFgColor: ColorManager.primary,
              initialLabelIndex: 0,
              totalSwitches: 2,
              labels: const ['Upcoming', 'Past'],
              customTextStyles: const [
                TextStyle(
                  fontSize: AppSize.s16,
                  fontWeight: FontWeight.w600,
                )
              ],
              radiusStyle: true,
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
          ),
          // AppointmentWidget(),
        ],
      ),
    );
  }
}
