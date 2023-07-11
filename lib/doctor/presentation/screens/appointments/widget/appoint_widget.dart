// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:intl/intl.dart';

class AppointWidget extends StatefulWidget {
  AppointWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  UserMyAppointments model;

  @override
  State<AppointWidget> createState() => _AppointWidgetState();
}

class _AppointWidgetState extends State<AppointWidget> {
  @override
  void initState() {
    super.initState();
    getType(widget.model.type);
  }

  late String text;

  late IconData icon;

  getType(String type) {
    if (type == 'chat') {
      text = 'Chat';
      icon = Icons.chat;
    } else if (type == 'video call') {
      text = 'Video Call';
      icon = Icons.videocam_outlined;
    } else {
      text = 'Visit';
      icon = Icons.offline_bolt_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    widget.model.patientInfo?.name ?? '',
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
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: AppSize.s14,
                        color: Colors.black, // Default color for the text
                      ),
                      children: [
                        TextSpan(
                          text: text,
                        ),
                        TextSpan(
                          text: ' - Schedule',
                          style: TextStyle(
                            color: ColorManager.primary,
                          ), // Blue color for "Dr. Leo Messi"
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  Text(
                    "${DateFormat.jm().format(DateTime.parse(widget.model.date))}  ${DateFormat.yMMMMd('en_US').format(DateTime.parse(widget.model.date))}",
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
    );
  }
}
