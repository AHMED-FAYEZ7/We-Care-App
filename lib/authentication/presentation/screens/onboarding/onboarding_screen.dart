// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_care/authentication/domain/usecase/doctor_sinup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/patient_signup_usecase.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/assets/app_assets.dart';
import 'package:health_care/core/global/resources/strings_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:health_care/core/services/services_locator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PatientSignUpUseCase useCase = sl<PatientSignUpUseCase>();

  DoctorSignUpUseCase doctor = sl<DoctorSignUpUseCase>();

  final AppPreferences _appPreferences = sl<AppPreferences>();

  late final List<SliderObject> _list = _getSliderData();

  final PageController _pageController = PageController();
  bool isLast = false;
  List<SliderObject> _getSliderData() => [
        SliderObject(
          AppStrings.onBoardingTitle1,
          AppStrings.onBoardingSubTitle1,
          ImageAssets.onBoardingLogo2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle2,
          AppStrings.onBoardingSubTitle2,
          ImageAssets.onBoardingLogo2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle3,
          AppStrings.onBoardingSubTitle3,
          ImageAssets.onBoardingLogo2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle4,
          AppStrings.onBoardingSubTitle4,
          ImageAssets.onBoardingLogo2,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _list.length,
                onPageChanged: (index) {
                  if (index == _list.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) {
                  return OnBoardingPage(_list[index]);
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: ColorManager.primary,
                dotHeight: 11,
                expansionFactor: 4,
                dotWidth: 11,
                spacing: 5.0,
              ),
              count: _list.length,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 20),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.toggleRoute,
                      );
                    },
                    child: Text(
                      "skip",
                      style: TextStyle(
                        fontSize: 20,
                        color: ColorManager.lightGrey,
                      ),
                    ),
                  ),
                  const Spacer(),
                  FloatingActionButton.extended(
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isLast
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: ColorManager.white,
                                  ),
                                ),
                              )
                            : Container(),
                        const Icon(
                          Icons.arrow_forward_rounded,
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (isLast) {
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    backgroundColor: ColorManager.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(
            '${_sliderObject.image}',
          ),
          fit: BoxFit.fitHeight,
          height: 250,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              _sliderObject.title,
              style: TextStyle(
                fontSize: 40,
                color: ColorManager.darkPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              _sliderObject.subTitle,
              style: TextStyle(
                fontSize: 20,
                color: ColorManager.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
