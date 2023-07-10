import 'package:flutter/material.dart';
import 'package:health_care/core/assets/app_assets.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/specialist_doctor_card_widget.dart';

class SpecialistDoctorPatientScreen extends StatelessWidget {
  const SpecialistDoctorPatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Specialist Doctor',
        isBack: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: GridView.count(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 1 / 1,
                children: List.generate(
                  10,
                  (index) => SpecialistDoctorCardWidget(
                    specialistImage: ImageAssets.splashLogo,
                    specialistName: 'heart',
                    specialistNoDoctors: 252,
                    specialistColor: ColorManager.error,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
