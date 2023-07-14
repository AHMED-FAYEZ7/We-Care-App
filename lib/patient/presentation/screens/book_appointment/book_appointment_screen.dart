// ignore_for_file: avoid_print, must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/assets/app_assets.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/strings_manger.dart';
import 'package:health_care/core/widgets/text_button_widget.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';
import 'package:health_care/patient/presentation/screens/book_appointment/widget/selected_fee_info_widget.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/hint_text_widget.dart';
import 'package:health_care/core/widgets/loading_widget.dart';
import 'package:intl/intl.dart';

class BookAppointmentScreen extends StatefulWidget {
  BookAppointmentScreen({
    required this.appointmentList,
    required this.date,
    required this.day,
    Key? key,
  }) : super(key: key);

  List<BaseAppointment> appointmentList;
  String date;
  String day;

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  int selectedIndex = -1;
  int selectedWay = -1;
  String? appointmentId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        if (state is BookAppointmentByIdSuccessState) {
          _dialogBuilder(
            context,
            appointmentId!,
          );
        }
      },
      builder: (context, state) {
        var cubit = PatientCubit.get(context);
        return Scaffold(
          appBar: AppBarWidget(
            title: 'Book Appointment',
            isBack: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                HintTextWidget(
                  title: "${widget.day}, ${widget.date}",
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                ConditionalBuilder(
                  condition: cubit.availableAppointmentsByDayData.isNotEmpty,
                  builder: (context) =>
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * .4,
                        color: ColorManager.white,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p12,
                            ),
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 1,
                              children: List.generate(
                                widget.appointmentList.length,
                                    (index) =>
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                          if (widget.appointmentList[index]
                                              .type ==
                                              'chat') {
                                            selectedWay = 0;
                                          } else if (widget
                                              .appointmentList[index].type ==
                                              'video call') {
                                            selectedWay = 1;
                                          } else {
                                            selectedWay = 2;
                                          }
                                          appointmentId = widget
                                              .appointmentList[index]
                                              .appointmentId;
                                        });
                                      },
                                      child: Card(
                                        elevation: AppSize.s3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(AppSize.s12),
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              AppSize.s8,
                                            ),
                                            color: selectedIndex == index
                                                ? ColorManager.primary
                                                : ColorManager.lightGrey,
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: [
                                              Text(
                                                DateFormat.jm().format(
                                                    DateTime.parse(
                                                        widget
                                                            .appointmentList[index]
                                                            .date)),
                                                style: TextStyle(
                                                  fontSize: AppSize.s20,
                                                  color: selectedIndex == index
                                                      ? ColorManager.white
                                                      : ColorManager.primary,
                                                ),
                                              ),
                                              Text(
                                                widget.appointmentList[index]
                                                    .type,
                                                style: TextStyle(
                                                  fontSize: AppSize.s18,
                                                  color: selectedIndex == index
                                                      ? ColorManager.white
                                                      : ColorManager.primary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  fallback: (context) =>
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * .4,
                        child: Center(
                          child: Text(
                              "No available appointment in ${widget
                                  .day}, ${widget.date}"),
                        ),
                      ),
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                SelectedFeeInfoWidget(
                  selectedIndex: selectedWay,
                ),
                ConditionalBuilder(
                  condition: state is! BookAppointmentByIdLoadingState,
                  builder: (context) =>
                      TextButtonWidget(
                        icon: Container(
                          width: AppSize.s0,
                        ),
                        borderColor: appointmentId == null
                            ? ColorManager.lightGrey
                            : ColorManager.primary,
                        backGroundColor: appointmentId == null
                            ? ColorManager.lightGrey
                            : ColorManager.primary,
                        textColor: ColorManager.white,
                        width: AppSize.s330,
                        height: AppSize.s52,
                        text: "Next",
                        fontWeight: FontWeight.bold,
                        onTap:
                        // appointmentId == null
                        //     ? () async {}
                        //     : () async {
                        //         cubit.bookAppointment(appointmentId!);
                        //         print(
                        //           appointmentId,
                        //         );
                        //        }
                            () {
                          _dialogBuilder(context, '66');
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

Future<void> _dialogBuilder(BuildContext context, String appointmentId) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSize.s16,
          vertical: AppSize.s16,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Successful',
              style: TextStyle(
                color: ColorManager.primary,
                fontSize: AppSize.s20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              'Your appointment booking successfully completed',
              style: TextStyle(
                color: ColorManager.black,
                fontSize: AppSize.s12,
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            TextButtonWidget(
              borderColor: ColorManager.primary,
              backGroundColor: ColorManager.primary,
              textColor: ColorManager.white,
              height: AppSize.s52,
              text: 'Let\'s Pay',
              icon: SizedBox(
                height: AppSize.s33,
                child: Icon(
                  Icons.payment_outlined,
                  color: ColorManager.white,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.paymentRoute,
                  // arguments: {
                  //   "url"
                  // }
                );
              },
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            TextButtonWidget(
              borderColor: ColorManager.primary,
              backGroundColor: ColorManager.primary,
              textColor: ColorManager.white,
              height: AppSize.s52,
              text: 'Home',
              icon: SizedBox(
                height: AppSize.s33,
                child: Icon(
                  IconBroken.Home,
                  color: ColorManager.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
