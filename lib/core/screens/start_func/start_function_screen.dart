// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:health_care/core/widgets/divider_widget.dart';
import 'package:health_care/core/widgets/snack_bar_widget.dart';
import 'package:health_care/core/widgets/text_button_widget.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/presentation/screens/doctor_profile/widget/column_info.dart';
import 'package:health_care/patient/presentation/widgets/doctor_widget.dart';
import 'package:health_care/patient/presentation/widgets/hint_text_widget.dart';
import 'package:intl/intl.dart';

class StartFunctionScreen extends StatefulWidget {
  StartFunctionScreen({
    required this.model,
    Key? key,
  }) : super(key: key);

  UserMyAppointments model;

  @override
  State<StartFunctionScreen> createState() => _StartFunctionScreenState();
}

class _StartFunctionScreenState extends State<StartFunctionScreen> {
  late String button;

  late IconData icon;

  @override
  void initState() {
    super.initState();
    getType(widget.model.type);
  }

  getType(String type) {
    if (type == 'chat') {
      button = 'Message Now';
      icon = Icons.chat_outlined;
    } else if (type == 'video call') {
      button = 'Video Call Now';
      icon = Icons.videocam_outlined;
    } else {
      button = 'Visit';
      icon = Icons.offline_bolt_outlined;
    }
  }

  bool isTimeWithinRange(String time) {
    // Get the current time in Egypt
    final currentTime = DateTime.now();
    print(currentTime);

    // Parse the backend time string to DateTime object
    final backendTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ").parse(time);
    print(backendTime);

    // Add 15 minutes to the backend time
    final backendTimePlus15Min = backendTime.add(Duration(minutes: 15));
    print(backendTimePlus15Min);

    // Compare the current time with backend time + 15 minutes
    return currentTime.isAfter(backendTime) &&
        currentTime.isBefore(backendTimePlus15Min);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
        title: 'My Appointments',
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .95,
            height: AppSize.s100,
            child: Card(
              elevation: AppSize.s3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppSize.s12),
                      bottomLeft: Radius.circular(AppSize.s12),
                    ),
                    child: Image.network(
                      "https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg",
                      fit: BoxFit.cover,
                      width: AppSize.s100,
                      height: AppSize.s100,
                    ),
                  ),
                  const SizedBox(
                    width: AppSize.s10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .46,
                    height: AppSize.s100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.doctorInfo!.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: AppSize.s14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s5,
                        ),
                        Row(
                          children: [
                            Text(
                              "(12 reviews)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s5,
                        ),
                        Text(
                          "${widget.model.doctorInfo!.specialization} Specialist - Ramsay College Hospital",
                          maxLines: 2,
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: AppSize.s10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      icon,
                    ),
                  ),
                ],
              ),
            ),
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
            ),
            child: MyDividerWidget(
              height: AppSize.s10,
            ),
          ),
          SizedBox(
            height: AppSize.s10,
          ),
          HintTextWidget(
            title: 'Visit Time',
            isSuffix: false,
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                DateFormat.yMMMMd('en_US')
                    .format(DateTime.parse(widget.model.date)),
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                DateFormat.jm().format(DateTime.parse(widget.model.date)),
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
            ),
            child: MyDividerWidget(
              height: AppSize.s10,
            ),
          ),
          SizedBox(
            height: AppSize.s10,
          ),
          HintTextWidget(
            title: 'Patient Information',
            isSuffix: false,
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Full Name   : ${widget.model.patientInfo!.name}",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Age               : 30+",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Phone          :+201026142957",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
            ),
            child: MyDividerWidget(
              height: AppSize.s10,
            ),
          ),
          SizedBox(
            height: AppSize.s10,
          ),
          HintTextWidget(
            title: 'Fee Information',
            isSuffix: false,
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "\$${widget.model.price} (Paid)",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          if (widget.model.type != 'visit')
            TextButtonWidget(
              icon: Container(
                width: AppSize.s0,
              ),
              borderColor: ColorManager.primary,
              backGroundColor: ColorManager.primary,
              textColor: ColorManager.white,
              width: AppSize.s330,
              height: AppSize.s52,
              text:
                  "$button (Start at ${DateFormat.jm().format(DateTime.parse(widget.model.date))})",
              fontWeight: FontWeight.bold,
              onTap: () async {
                // "2023-07-13T17:12:00.000Z"
                final isWithinRange = isTimeWithinRange(widget.model.date);
                print('Is time within range: $isWithinRange');
                if (isWithinRange) {
                  if (widget.model.type == 'chat') {
                    Navigator.pushNamed(context, Routes.chatRoute, arguments: {
                      'senderId': widget.model.patientInfo!.id,
                      'receiverId': widget.model.doctorInfo!.id,
                    });
                  } else {
                    Navigator.pushNamed(context, Routes.videoRoute, arguments: {
                      // 'userID': widget.model.patientInfo!.id,
                      // 'userName': widget.model.patientInfo!.name,
                      'userID': "64564cc5061fd8d24c5ef612",
                      'userName': "basyon",
                    });
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBarWidget(
                      text: Text(
                        'Sorry, you are out of Time',
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
        ],
      ),
    );
  }
}
