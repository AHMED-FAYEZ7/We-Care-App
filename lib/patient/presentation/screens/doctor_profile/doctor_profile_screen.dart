import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/patient/presentation/screens/doctor_profile/widget/clendar.dart';
import 'package:health_care/patient/presentation/screens/doctor_profile/widget/column_info.dart';
import 'package:health_care/patient/presentation/widgets/app_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/doctor_widget.dart';
import 'package:health_care/patient/presentation/widgets/hint_text_widget.dart';

class DoctorProfilePatientScreen extends StatelessWidget {
  const DoctorProfilePatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(
              title: "Dr. Ahmed Fayez",
            ),
            DoctorWidget(
              doctorImage: 'assets/images/me1.jpg',
              doctorName: 'Dr. Ahmed Fayez',
              doctorSpecialist: "Dental",
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .95,
              height: AppSize.s100,
              child: Card(
                elevation: AppSize.s0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  side: const BorderSide(color: Colors.grey, width: AppSize.s1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ColumnInfoWidget(
                      icon: Icons.group,
                      number: 5000,
                      subTitle: 'Patient',
                    ),
                    ColumnInfoWidget(
                      icon: Icons.person,
                      number: 15,
                      subTitle: 'Years experiences',
                    ),
                    ColumnInfoWidget(
                      icon: Icons.chat,
                      number: 3800,
                      subTitle: 'Reviews',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s15,
            ),
            HintTextWidget(
              title: 'About Doctor',
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Material is an adaptable system of guidelines, components, and tools that support the best practices of user interface design. Backed by open-source code, Material streamlines collaboration between designers and developers, and helps teams quickly build beautiful products.",
                  maxLines: 4,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s15,
            ),
            HintTextWidget(
              title: 'Working Time',
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Mon-Fri,09.00AM-20.00PM",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s15,
            ),
            HintTextWidget(
              title: 'Reviews',
              isSuffix: true,
              onTapTitle: 'See Reviews',
              onTap: () {},
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            HintTextWidget(
              title: 'Make Appointment',
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Calendar(),
          ],
        ),
      ),
    );
  }
}
