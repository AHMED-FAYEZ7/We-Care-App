// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';
import 'package:health_care/patient/presentation/screens/appointment/widget/appointment_widget.dart';
import 'package:health_care/patient/presentation/widgets/empty_list_widget.dart';
import 'package:health_care/patient/presentation/widgets/shimmer/doctor_shimmer_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AppointmentPatientScreen extends StatefulWidget {
  AppointmentPatientScreen({Key? key}) : super(key: key);

  int appointmentIndex = 0;
  @override
  State<AppointmentPatientScreen> createState() =>
      _AppointmentPatientScreenState();
}

class _AppointmentPatientScreenState extends State<AppointmentPatientScreen> {
  @override
  void initState() {
    super.initState();
    PatientCubit.get(context).getMyAppointments(const NoParameters());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PatientCubit.get(context);
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
                  initialLabelIndex: widget.appointmentIndex,
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
                    setState(() {
                      widget.appointmentIndex = index!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              ConditionalBuilder(
                condition: widget.appointmentIndex == 0,
                builder: (context) => Expanded(
                  child: ConditionalBuilder(
                    condition: state is! GetMyAppointmentsLoadingState,
                    builder: (context) => cubit.upcomingAppointments.isNotEmpty
                        ? ListView.separated(
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p12,
                            ),
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                AppointmentWidget(
                              model: cubit.upcomingAppointments[index],
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              width: AppSize.s10,
                            ),
                            itemCount: cubit.upcomingAppointments.length,
                          )
                        : EmptyListWidget(
                            text: 'No Upcoming Appointments Here',
                          ),
                    fallback: (context) => DoctorShimmerWidget(),
                  ),
                ),
                fallback: (context) => Expanded(
                  child: ConditionalBuilder(
                    condition: state is! GetMyAppointmentsLoadingState,
                    builder: (context) => cubit.pastAppointments.isNotEmpty
                        ? ListView.separated(
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p12,
                            ),
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                AppointmentWidget(
                              model: cubit.pastAppointments[index],
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              width: AppSize.s10,
                            ),
                            itemCount: cubit.pastAppointments.length,
                          )
                        : EmptyListWidget(
                            text: 'No Past Appointments Here',
                          ),
                    fallback: (context) => DoctorShimmerWidget(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
