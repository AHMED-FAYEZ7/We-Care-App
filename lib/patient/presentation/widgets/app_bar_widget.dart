// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/core/assets/app_assets.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/patient/presentation/widgets/search_bar_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    this.title,
    this.isBack = false,
    this.isSearch = false,
    this.isHome = false,
    Key? key,
  }) : super(key: key);

  String? title;
  bool isBack = false;
  bool isSearch = false;
  bool isHome = false;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // toolbarHeight: MediaQuery.of(context).size.height * .2,
      backgroundColor: ColorManager.white,
      leading: isBack
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                IconBroken.Arrow___Left,
                color: ColorManager.primary,
              ),
            )
          : Image.asset(
              ImageAssets.splashLogo,
              scale: 1.4,
            ),
      title: isSearch
          ? SizedBox(
              width: MediaQuery.of(context).size.width * .866,
              child: SearchBarWidget(
                readOnly: false,
                initialValue: "Dr. ",
                onTap: () {},
              ),
            )
          : Text(
              title!,
            ),
      actions: [
        if (isHome)
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconBroken.Notification,
              color: ColorManager.primary,
            ),
          ),
        if (isHome)
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconBroken.Heart,
              color: ColorManager.primary,
            ),
          ),
      ],
    );
  }
}
