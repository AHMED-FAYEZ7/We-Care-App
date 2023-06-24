import 'package:flutter/material.dart';
import 'package:health_care/core/assets/app_assets.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/patient/presentation/widgets/hint_text_widget.dart';
import 'package:health_care/patient/presentation/widgets/search_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/specialist_doctor_card_widget.dart';
import 'package:health_care/patient/presentation/widgets/top_doctor_card_widget.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SearchBarWidget(
              readOnly: true,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.patientSearchRoute,
                );
              },
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            HintTextWidget(
              title: 'Specialist Doctor',
              seeAll: () {
                Navigator.pushNamed(
                  context,
                  Routes.patientSpecialistDoctorRoute,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p12,
              ),
              child: Container(
                height: AppSize.s180,
                margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                      SpecialistDoctorCardWidget(
                    specialistImage: ImageAssets.splashLogo,
                    specialistName: 'heart',
                    specialistNoDoctors: 252,
                    specialistColor: ColorManager.error,
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: AppSize.s10,
                  ),
                  itemCount: 10,
                ),
              ),
            ),
            HintTextWidget(
              title: 'Top Doctor',
              seeAll: () {
                Navigator.pushNamed(
                  context,
                  Routes.patientTopDoctorRoute,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p12,
              ),
              child: Container(
                height: AppSize.s180,
                margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                      TopDoctorCardWidget(
                    doctorImage: 'assets/images/me1.jpg',
                    doctorName: 'Dr. Ahmed Fayez',
                    doctorSpecialist: "Dental",
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: AppSize.s10,
                  ),
                  itemCount: 10,
                ),
              ),
            ),
            HintTextWidget(
              title: 'Recommendation',
              seeAll: () {},
            ),
          ],
        ),
      ),
    );
  }
}
