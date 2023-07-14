// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/widgets/snack_bar_widget.dart';
import 'package:health_care/core/widgets/text_button_widget.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/widgets/loading_widget.dart';
import 'package:health_care/doctor/presentation/controller/doctor_cubit/doctor_cubit.dart';
import 'package:health_care/patient/presentation/screens/book_appointment/widget/selected_fee_info_widget.dart';
import 'package:health_care/core/widgets/clendar.dart';
import 'package:health_care/patient/presentation/widgets/hint_text_widget.dart';
import 'package:intl/intl.dart';

class HomeDoctorScreen extends StatefulWidget {
  HomeDoctorScreen({Key? key}) : super(key: key);

  int selectedIndex = 0;

  @override
  State<HomeDoctorScreen> createState() => _HomeDoctorScreenState();
}

class _HomeDoctorScreenState extends State<HomeDoctorScreen> {
  TextEditingController timeController = TextEditingController();

  TextEditingController periodController = TextEditingController();

  int period = 1;

  String? date;

  String type = 'chat';

  String todayDate = DateTime.now().toString().substring(0, 10);

  void handleSelectedDate(String selectedDate, String selectedDay) {
    date = selectedDate;
  }

  List<Item> typeList = [
    Item(
      Icons.message,
      'Messaging',
      'chat',
    ),
    Item(
      Icons.videocam,
      'Video Call',
      'video call',
    ),
    Item(
      Icons.offline_bolt_outlined,
      'Visit',
      'visit',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        if (state is CreateBlockSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarWidget(
              text: Text(
                'Time Block Created Successfully',
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s16,
                ),
              ),
              backGroundColor: Colors.green,
            ),
          );
        }
        if (state is CreateBlockFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarWidget(
              text: Text(
                state.error,
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s16,
                ),
              ),
              backGroundColor: ColorManager.error,
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = DoctorCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: AppSize.s3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s20),
                  ),
                  color: ColorManager.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Hi Dr.${cubit.doctorData?.name ?? ''}, let's add more appointments to treat more people and help them complete their lives \nsafely and without fear",
                      style: TextStyle(
                          fontSize: AppSize.s15,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s25,
                ),
                HintTextWidget(
                  title: 'Select Day',
                  isSuffix: false,
                ),
                Calendar(
                  selectedDate: handleSelectedDate,
                ),
                SizedBox(
                  height: AppSize.s25,
                ),
                HintTextWidget(
                  title: 'Select Time',
                  isSuffix: false,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p12,
                  ),
                  child: Card(
                    elevation: AppSize.s3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s20),
                    ),
                    child: TextFormField(
                      controller: timeController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        hintText: 'Select time here...',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s20),
                          borderSide: BorderSide(
                            color: ColorManager.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s20),
                          borderSide: BorderSide(
                            color: ColorManager.white,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s20),
                          borderSide: BorderSide(
                            width: AppSize.s1_5,
                            color: ColorManager.white,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s20),
                          borderSide: BorderSide(
                            width: AppSize.s1_5,
                            color: ColorManager.white,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 8, bottom: 5, top: 5, right: 5),
                      ),
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(hour: 7, minute: 15),
                          initialEntryMode: TimePickerEntryMode.input,
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData(
                                primaryColor: ColorManager.primary,
                                hintColor: ColorManager.primary,
                                colorScheme: ColorScheme.light(
                                  primary: ColorManager.primary,
                                ), // Text color
                              ),
                              child: child!,
                            );
                          },
                        ).then((value) {
                          timeController.text =
                              value!.format(context).toString();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s25,
                ),
                HintTextWidget(
                  title: 'Add Period',
                  isSuffix: false,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p12,
                  ),
                  child: Card(
                    elevation: AppSize.s3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s20),
                    ),
                    child: TextFormField(
                      controller: periodController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Add Period here...',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s20),
                          borderSide: BorderSide(
                            color: ColorManager.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s20),
                          borderSide: BorderSide(
                            color: ColorManager.white,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s20),
                          borderSide: BorderSide(
                            width: AppSize.s1_5,
                            color: ColorManager.white,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s20),
                          borderSide: BorderSide(
                            width: AppSize.s1_5,
                            color: ColorManager.white,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 8, bottom: 5, top: 5, right: 5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s25,
                ),
                HintTextWidget(
                  title: 'Select Type',
                  isSuffix: false,
                ),
                SizedBox(
                  height: AppSize.s50,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p12,
                    ),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            widget.selectedIndex = index;
                            type = typeList[index].type;
                          });
                        },
                        child: SizedBox(
                          width: AppSize.s130,
                          child: Card(
                            elevation: AppSize.s3,
                            color: widget.selectedIndex == index
                                ? ColorManager.primary
                                : ColorManager.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSize.s12,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                AppPadding.p8,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    typeList[index].icon,
                                    color: widget.selectedIndex == index
                                        ? ColorManager.white
                                        : ColorManager.primary,
                                    size: AppSize.s20,
                                  ),
                                  const SizedBox(
                                    width: AppSize.s5,
                                  ),
                                  Text(
                                    typeList[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: widget.selectedIndex == index
                                          ? ColorManager.white
                                          : ColorManager.black,
                                      fontSize: AppSize.s14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: AppSize.s5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: AppSize.s5,
                      ),
                      itemCount: typeList.length,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s5,
                ),
                ConditionalBuilder(
                  condition: state is! CreateBlockLoadingState,
                  builder: (context) => TextButtonWidget(
                    icon: Container(
                      width: AppSize.s0,
                    ),
                    borderColor:
                        // appointmentId == null
                        //     ? ColorManager.lightGrey
                        //     :
                        ColorManager.primary,
                    backGroundColor:
                        // appointmentId == null
                        //     ? ColorManager.lightGrey
                        //     :
                        ColorManager.primary,
                    textColor: ColorManager.white,
                    width: AppSize.s330,
                    height: AppSize.s52,
                    text: "Next",
                    fontWeight: FontWeight.bold,
                    onTap: () async {
                      if (timeController.text != '' &&
                          periodController.text != '') {
                        String reformatDateTime(String dateTimeString) {
                          final inputFormat = DateFormat('yyyy-MM-dd hh:mm a');
                          final dateTime = inputFormat.parse(dateTimeString);
                          final outputFormat =
                              DateFormat('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'');
                          final formattedDateTime =
                              outputFormat.format(dateTime);
                          return formattedDateTime;
                        }

                        final originalDateTime =
                            "${date ?? todayDate} ${timeController.text}";
                        final formattedDateTime =
                            reformatDateTime(originalDateTime);
                        cubit.createTimeBlock(
                          int.parse(periodController.text),
                          formattedDateTime,
                          type,
                        );
                      } else if (timeController.text == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBarWidget(
                            text: Text(
                              'please add time',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontSize: AppSize.s16,
                              ),
                            ),
                            backGroundColor: ColorManager.error,
                          ),
                        );
                      } else if (periodController.text == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBarWidget(
                            text: Text(
                              'please add period',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontSize: AppSize.s16,
                              ),
                            ),
                            backGroundColor: ColorManager.error,
                          ),
                        );
                      }
                    },
                  ),
                  fallback: (context) => LoadingWidget(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Item {
  IconData icon;
  String title;
  String type;

  Item(
    this.icon,
    this.title,
    this.type,
  );
}
