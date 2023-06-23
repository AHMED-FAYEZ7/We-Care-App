import 'package:flutter/material.dart';
import 'package:health_care/core/assets/app_assets.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * .2,
      backgroundColor: ColorManager.white,
      leading: Image.asset(
        ImageAssets.splashLogo,
        scale: 1.4,
      ),
      title: const Text(
        'We Care',
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            IconBroken.Notification,
            color: ColorManager.primary,
          ),
        ),
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
