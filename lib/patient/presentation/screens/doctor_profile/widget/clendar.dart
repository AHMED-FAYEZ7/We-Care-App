// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
      ScrollController(); //To Track Scroll of ListView

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: AppSize.s100,
            child: ListView.separated(
              padding: const EdgeInsets.only(
                left: AppPadding.p12,
              ),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: AppSize.s10,
                );
              },
              itemCount: 365,
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      currentDateSelectedIndex = index;
                      selectedDate = DateTime.now().add(Duration(days: index));
                    });
                    print(selectedDate.toString());
                  },
                  child: Container(
                    height: AppSize.s80,
                    width: AppSize.s60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s8),
                      border: Border.all(color: ColorManager.primary),
                      color: currentDateSelectedIndex == index
                          ? ColorManager.primary
                          : ColorManager.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          listOfMonths[DateTime.now()
                                      .add(Duration(days: index))
                                      .month -
                                  1]
                              .toString(),
                          style: TextStyle(
                            fontSize: AppSize.s16,
                            color: currentDateSelectedIndex == index
                                ? ColorManager.white
                                : ColorManager.black,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s5,
                        ),
                        Text(
                          DateTime.now()
                              .add(Duration(days: index))
                              .day
                              .toString(),
                          style: TextStyle(
                            fontSize: AppSize.s22,
                            fontWeight: FontWeight.w700,
                            color: currentDateSelectedIndex == index
                                ? ColorManager.white
                                : ColorManager.black,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s5,
                        ),
                        Text(
                          listOfDays[DateTime.now()
                                      .add(Duration(days: index))
                                      .weekday -
                                  1]
                              .toString(),
                          style: TextStyle(
                            fontSize: AppSize.s16,
                            color: currentDateSelectedIndex == index
                                ? ColorManager.white
                                : ColorManager.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
      ],
    );
  }
}
