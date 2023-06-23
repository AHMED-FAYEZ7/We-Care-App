import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/assets/app_assets.dart';
import 'package:health_care/patient/presentation/controller/patient_cubit.dart';
import 'package:health_care/patient/presentation/widgets/app_bar_widget.dart';

import '../../../../core/global/resources/icons_manger.dart';
import '../../../../core/global/resources/strings_manger.dart';
import '../../../../core/global/resources/values_manger.dart';
import '../../../../core/global/theme/app_color/color_manager.dart';

class PatientLayoutScreen extends StatefulWidget {
  const PatientLayoutScreen({Key? key}) : super(key: key);

  @override
  State<PatientLayoutScreen> createState() => _PatientLayoutScreenState();
}

class _PatientLayoutScreenState extends State<PatientLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = PatientCubit.get(context);
    return BlocConsumer<PatientCubit, PatientState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarWidget(),
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
                showElevation: false, // use this to remove appBar's elevation
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
                      icon: const Icon(Icons.date_range_outlined),
                      title: const Text(AppStrings.appointment),
                      activeColor: ColorManager.primary,
                      inactiveColor: ColorManager.primary),
                  BottomNavyBarItem(
                      icon: const Icon(Icons.history),
                      title: const Text(AppStrings.history),
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
