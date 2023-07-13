// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/widgets/text_button_widget.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';
import 'package:health_care/core/widgets/clendar.dart';
import 'package:health_care/patient/presentation/screens/doctor_profile/widget/column_info.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/doctor_widget.dart';
import 'package:health_care/patient/presentation/widgets/hint_text_widget.dart';
import 'package:health_care/core/widgets/loading_widget.dart';
import 'package:jiffy/jiffy.dart';

class DoctorProfilePatientScreen extends StatelessWidget {
  DoctorProfilePatientScreen({
    required this.doctorModel,
    Key? key,
  }) : super(key: key);

  User doctorModel;
  String? date;
  String? day;
  String todayDate = DateTime.now().toString().substring(0, 10);
  String today = Jiffy().EEEE;

  void handleSelectedDate(String selectedDate, String selectedDay) {
    date = selectedDate;
    day = selectedDay;
  }

  @override
  Widget build(BuildContext context) {
    var cubit = PatientCubit.get(context);

    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        if (state is GetAvailableAppointmentByDaySuccessState) {
          Navigator.pushNamed(
            context,
            Routes.bookAppointmentRoute,
            arguments: {
              'appointmentList': cubit.availableAppointmentsByDayData,
              'date': date ?? todayDate,
              'day': day ?? today,
            },
          );
        }
        if (state is GetDoctorRateSuccessState) {
          Navigator.pushNamed(
            context,
            Routes.reviewsRoute,
            arguments: cubit.rateList,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarWidget(
            isBack: true,
            title: doctorModel.name,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                DoctorWidget(
                  model: doctorModel,
                ),
                const SizedBox(
                  height: AppSize.s5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .95,
                  height: AppSize.s100,
                  child: Card(
                    elevation: AppSize.s3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s12),
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
                  onTap: () {
                    // cubit.getDoctorRate(doctorModel.id);
                    cubit.getDoctorRate("649593403f0633e0bc1cb0c8");
                  },
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
                Calendar(
                  selectedDate: handleSelectedDate,
                ),
                const SizedBox(
                  height: AppSize.s15,
                ),
                ConditionalBuilder(
                  condition: state is! GetAvailableAppointmentByDayLoadingState,
                  builder: (context) => TextButtonWidget(
                    icon: Container(
                      width: AppSize.s0,
                    ),
                    borderColor: ColorManager.primary,
                    backGroundColor: ColorManager.primary,
                    textColor: ColorManager.white,
                    width: AppSize.s330,
                    height: AppSize.s52,
                    text: "Book Appointment",
                    fontWeight: FontWeight.bold,
                    onTap: () async {
                      // cubit.getAvailableAppointmentByDay(
                      //   doctorModel.id,
                      //   date ?? todayDate,
                      // );

                      cubit.getAvailableAppointmentByDay(
                        "64b03d2a57ba4c7ac260e479",
                        "2023-07-18",
                      );
                    },
                  ),
                  fallback: (context) => const LoadingWidget(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
