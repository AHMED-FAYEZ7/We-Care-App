// ignore_for_file: avoid_print, must_be_immutable, prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/widgets/text_button_widget.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:health_care/core/widgets/loading_widget.dart';
import 'package:health_care/patient/presentation/widgets/rate_widget.dart';

class WriteReviewScreen extends StatelessWidget {
  WriteReviewScreen({
    this.rate = 3,
    Key? key,
  }) : super(key: key);

  int? rate;

  final TextEditingController _textarea = TextEditingController();

  handleRateSelected({int? selectedRate}) {
    rate = selectedRate!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PatientCubit.get(context);
        return Scaffold(
          appBar: AppBarWidget(
            isBack: true,
            title: "Write a Review",
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ClipOval(
                  child: Image.network(
                    "https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg",
                    fit: BoxFit.cover,
                    width: AppSize.s150,
                    height: AppSize.s150,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: AppSize.s16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black, // Default color for the text
                    ),
                    children: [
                      const TextSpan(text: 'How was your experience\nwith '),
                      TextSpan(
                        text: 'Dr. Leo Messi',
                        style: TextStyle(
                          color: ColorManager.primary,
                        ), // Blue color for "Dr. Leo Messi"
                      ),
                      const TextSpan(text: '?'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                RateWidget(
                  itemSize: 40,
                  itemPadding: 4,
                  onRateSelected: handleRateSelected,
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p12,
                  ),
                  child: Divider(),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p12,
                  ),
                  child: Row(
                    children: const [
                      Text(
                        "Write a comment",
                        style: TextStyle(
                          fontSize: AppSize.s14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Max 100 words",
                        style: TextStyle(
                          fontSize: AppSize.s14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    AppPadding.p12,
                  ),
                  child: TextFormField(
                    controller: _textarea,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    // Remove the maxLines property to allow unlimited lines
                    decoration: InputDecoration(
                      hintText: "Tell people about your experience",
                      hintStyle: TextStyle(
                        color: ColorManager.lightGrey,
                        fontSize: AppSize.s14,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManager.lightGrey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManager.primary,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                ConditionalBuilder(
                  condition: state is! MakeDoctorReviewLoadingState,
                  builder: (context) => TextButtonWidget(
                    icon: Container(
                      width: AppSize.s30,
                    ),
                    borderColor:
                        // appointmentId == null
                        //     ? ColorManager.lightGrey :
                        ColorManager.primary,
                    backGroundColor:
                        // appointmentId == null
                        //     ? ColorManager.lightGrey
                        //     :
                        ColorManager.primary,
                    textColor: ColorManager.white,
                    width: AppSize.s330,
                    height: AppSize.s52,
                    text: "Submit Review",
                    fontWeight: FontWeight.bold,
                    onTap: () async {
                      print(rate!);
                      // print(_textarea.text);
                      // cubit.makeDoctorReview(
                      //   "doctorId",
                      //   rate!,
                      //   _textarea.text,
                      // );
                    },
                  ),
                  fallback: (context) => const LoadingWidget(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
