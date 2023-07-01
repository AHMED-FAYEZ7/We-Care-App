import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  String selectedDate = DateTime.now()
      .toString()
      .substring(0, 10); // To track date (format: "2023-07-01")

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
          child: ListView.builder(
            padding: const EdgeInsets.only(left: AppPadding.p12),
            itemCount: 365,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final currentDate = DateTime.now().add(Duration(days: index));
              final isSelected =
                  currentDate.toString().substring(0, 10) == selectedDate;
              return Padding(
                padding: const EdgeInsets.only(right: AppPadding.p8),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedDate = currentDate.toString().substring(0, 10);
                    });
                    print(selectedDate);
                  },
                  child: Container(
                    height: AppSize.s80,
                    width: AppSize.s60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s8),
                      border: Border.all(color: ColorManager.primary),
                      color: isSelected
                          ? ColorManager.primary
                          : ColorManager.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          listOfMonths[currentDate.month - 1],
                          style: TextStyle(
                            fontSize: AppSize.s16,
                            color: isSelected
                                ? ColorManager.white
                                : ColorManager.black,
                          ),
                        ),
                        const SizedBox(height: AppSize.s5),
                        Text(
                          currentDate.day.toString(),
                          style: TextStyle(
                            fontSize: AppSize.s22,
                            fontWeight: FontWeight.w700,
                            color: isSelected
                                ? ColorManager.white
                                : ColorManager.black,
                          ),
                        ),
                        const SizedBox(height: AppSize.s5),
                        Text(
                          listOfDays[currentDate.weekday - 1],
                          style: TextStyle(
                            fontSize: AppSize.s16,
                            color: isSelected
                                ? ColorManager.white
                                : ColorManager.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
