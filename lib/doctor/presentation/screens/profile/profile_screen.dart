import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/widgets/divider_widget.dart';
import 'package:health_care/core/widgets/logout_widget.dart';
import 'package:health_care/core/widgets/profile_item_widget.dart';
import 'package:health_care/doctor/presentation/controller/doctor_cubit/doctor_cubit.dart';

class ProfileDoctorScreen extends StatelessWidget {
  const ProfileDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DoctorCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(
                AppSize.s12,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: AppSize.s40,
                        backgroundImage: NetworkImage(
                          cubit.doctorData?.profilePicture ??
                              Constants.defaultDoctorImage,
                        ),
                        backgroundColor: ColorManager.white,
                      ),
                      const SizedBox(
                        width: AppSize.s20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.doctorData?.name ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorManager.black,
                              fontSize: AppSize.s16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s5,
                          ),
                          Text(
                            cubit.doctorData?.email ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorManager.black,
                              fontSize: AppSize.s14,
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s5,
                          ),
                          Text(
                            "alex",
                            maxLines: 2,
                            style: TextStyle(
                              color: ColorManager.black,
                              fontSize: AppSize.s14,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          IconBroken.Edit,
                        ),
                      ),
                    ],
                  ),
                  MyDividerWidget(
                    height: AppSize.s10,
                  ),
                  ProfileItemWidget(
                    icon: IconBroken.Notification,
                    text: 'Notification',
                    onTap: () {},
                  ),
                  MyDividerWidget(
                    height: AppSize.s10,
                  ),
                  ProfileItemWidget(
                    icon: IconBroken.Lock,
                    text: 'Security',
                    onTap: () {},
                  ),
                  MyDividerWidget(
                    height: AppSize.s10,
                  ),
                  ProfileItemWidget(
                    icon: Icons.remove_red_eye_outlined,
                    text: 'Appearance',
                    onTap: () {},
                  ),
                  MyDividerWidget(
                    height: AppSize.s10,
                  ),
                  ProfileItemWidget(
                    icon: Icons.help_outline_outlined,
                    text: 'Help',
                    onTap: () {},
                  ),
                  MyDividerWidget(
                    height: AppSize.s10,
                  ),
                  ProfileItemWidget(
                    icon: Icons.people_outline,
                    text: 'Invite Friends',
                    onTap: () {},
                  ),
                  MyDividerWidget(
                    height: AppSize.s10,
                  ),
                  ProfileItemWidget(
                    icon: IconBroken.Logout,
                    text: 'Logout',
                    onTap: () {
                      BottomDialog().showBottomDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    return const Center(
      child: Text(
        "ProfileDoctorScreen",
      ),
    );
  }
}
