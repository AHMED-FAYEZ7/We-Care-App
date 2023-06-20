import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/patient/presentation/controller/patient_cubit.dart';

import '../../../../core/global/resources/icons_manger.dart';
import '../../../../core/global/resources/strings_manger.dart';
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
          appBar: AppBar(),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavyBar(
            backgroundColor: ColorManager.primary,
            selectedIndex: cubit.currentIndex,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: (index) {
              setState(() {
                cubit.changeBottomNav(index);
              });
            },
            items: [
              BottomNavyBarItem(
                  icon: const Icon(IconBroken.Home),
                  title: const Text(AppStrings.home),
                  activeColor: ColorManager.white,
                  inactiveColor: ColorManager.black),
              BottomNavyBarItem(
                  icon: const Icon(Icons.date_range_outlined),
                  title: const Text(AppStrings.appointment),
                  activeColor: ColorManager.white,
                  inactiveColor: ColorManager.black),
              BottomNavyBarItem(
                  icon: const Icon(Icons.history),
                  title: const Text(AppStrings.history),
                  activeColor: ColorManager.white,
                  inactiveColor: ColorManager.black),
              BottomNavyBarItem(
                  icon: const Icon(IconBroken.Profile),
                  title: const Text(AppStrings.profile),
                  activeColor: ColorManager.white,
                  inactiveColor: ColorManager.black),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
