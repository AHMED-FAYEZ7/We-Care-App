import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/strings_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/doctor/presentation/controller/doctor_cubit/doctor_cubit.dart';
import 'package:health_care/patient/presentation/widgets/app_bar_widget.dart';

class DoctorLayoutScreen extends StatefulWidget {
  const DoctorLayoutScreen({Key? key}) : super(key: key);

  @override
  State<DoctorLayoutScreen> createState() => _DoctorLayoutScreenState();
}

class _DoctorLayoutScreenState extends State<DoctorLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      builder: (context, state) {
        var cubit = DoctorCubit.get(context);
        return Scaffold(
          appBar: AppBarWidget(
            isHome: true,
            title: cubit.titles[cubit.currentIndex],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Material(
            color: ColorManager.white,
            elevation: AppSize.s10,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSize.s18),
              topRight: Radius.circular(AppSize.s18),
            ),
            child: Container(
              height: AppSize.s70,
              padding: const EdgeInsets.all(10),
              child: BottomNavyBar(
                backgroundColor: ColorManager.white,
                selectedIndex: cubit.currentIndex,
                showElevation: false,
                // use this to remove appBar's elevation
                onItemSelected: (index) {
                  setState(() {
                    cubit.changeBottomNav(index);
                  });
                },
                items: [
                  BottomNavyBarItem(
                      icon: const Icon(IconBroken.Home),
                      title: const Text(AppStrings.home),
                      activeColor: ColorManager.primary,
                      inactiveColor: ColorManager.primary),
                  BottomNavyBarItem(
                    icon: const Icon(Icons.dynamic_feed),
                    title: const Text(AppStrings.feeds),
                    activeColor: ColorManager.primary,
                    inactiveColor: ColorManager.primary,
                  ),
                  BottomNavyBarItem(
                      icon: const Icon(Icons.date_range_outlined),
                      title: const Text(AppStrings.appointment),
                      activeColor: ColorManager.primary,
                      inactiveColor: ColorManager.primary),
                  BottomNavyBarItem(
                      icon: const Icon(IconBroken.Profile),
                      title: const Text(AppStrings.profile),
                      activeColor: ColorManager.primary,
                      inactiveColor: ColorManager.primary),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
