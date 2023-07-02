import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class SelectedFeeInfoWidget extends StatefulWidget {
  SelectedFeeInfoWidget({Key? key}) : super(key: key);

  @override
  State<SelectedFeeInfoWidget> createState() => _SelectedFeeInfoWidgetState();
}

class _SelectedFeeInfoWidgetState extends State<SelectedFeeInfoWidget> {
  int selectedItem = -1;

  List<Item> feeList = [
    Item(
      Icons.message,
      'Messaging',
      'Can messaging with doctor',
      '5',
    ),
    Item(
      Icons.phone,
      'Voice Call',
      'Can make a voice call with doctor',
      '10',
    ),
    Item(
      Icons.videocam,
      'Video Call',
      'Can make a video call with doctor',
      '20',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12,
          ),
          child: SizedBox(
            height: AppSize.s255,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    selectedItem = index;
                  });
                },
                child: SizedBox(
                  height: AppSize.s80,
                  child: Card(
                    elevation: AppSize.s0,
                    color: selectedItem == index
                        ? ColorManager.primary
                        : ColorManager.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSize.s12,
                      ),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: AppSize.s1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p20,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            feeList[index].icon,
                            color: selectedItem == index
                                ? ColorManager.white
                                : ColorManager.primary,
                            size: AppSize.s30,
                          ),
                          const SizedBox(
                            width: AppSize.s10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  feeList[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: selectedItem == index
                                        ? ColorManager.white
                                        : ColorManager.black,
                                    fontSize: AppSize.s14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: AppSize.s5,
                                ),
                                Text(
                                  feeList[index].message,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: selectedItem == index
                                        ? ColorManager.white
                                        : ColorManager.grey,
                                    fontSize: AppSize.s10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "${feeList[index].price}\$",
                            style: TextStyle(
                              color: selectedItem == index
                                  ? ColorManager.white
                                  : ColorManager.black,
                              fontSize: AppSize.s15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: AppSize.s5,
              ),
              itemCount: feeList.length,
            ),
          ),
        ),
      ],
    );
  }
}

class Item {
  IconData icon;
  String title;
  String message;
  String price;

  Item(
    this.icon,
    this.title,
    this.message,
    this.price,
  );
}
