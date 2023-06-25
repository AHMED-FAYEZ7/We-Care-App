import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_care/authentication/presentation/widgets/default_form_field.dart';
import 'package:health_care/authentication/presentation/widgets/default_text_button.dart';
import 'package:health_care/authentication/presentation/widgets/horizontal_or_line.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/assets/app_assets.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/strings_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/utils/functions.dart';

class UserLoginScreen extends StatelessWidget {
  UserLoginScreen({Key? key}) : super(key: key);

  final AppPreferences _appPreferences = sl<AppPreferences>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: Colors.transparent,
      //     statusBarIconBrightness: Brightness.dark,
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: AppSize.s50,
                ),
                const Image(
                  fit: BoxFit.fitHeight,
                  height: AppSize.s150,
                  image: AssetImage(
                    ImageAssets.splashLogo,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  AppStrings.welcomeBack,
                  style: TextStyle(
                    fontSize: AppSize.s25,
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  AppStrings.loginAnnotation,
                  style: TextStyle(
                    fontSize: AppSize.s15,
                    color: ColorManager.grey,
                  ),
                ),
                DefaultFormField(
                  hintText: AppStrings.emailHint,
                  controller: _emailEditingController,
                  type: TextInputType.emailAddress,
                  validator: (input) =>
                      input!.isValidEmail() ? null : AppStrings.emailError,
                  prefix: IconBroken.Profile,
                  obscureText: false,
                ),
                DefaultFormField(
                  obscureText: true,
                  hintText: AppStrings.passwordHint,
                  controller: _passwordEditingController,
                  type: TextInputType.text,
                  validator: (input) => input!.isValidPassword()
                      ? null
                      : AppStrings.passwordError,
                  prefix: IconBroken.Lock,
                  prefixPressed: () {},
                  suffix: IconBroken.Unlock,
                  suffixPressed: () {},
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: AppPadding.p20,
                    ),
                    child: TextButton(
                      child: Text(
                        AppStrings.forgetPassword,
                        style: TextStyle(
                          fontSize: AppSize.s18,
                          color: ColorManager.darkPrimary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.forgotPasswordRoute,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                DefaultTextButton(
                  icon: Container(
                    width: AppSize.s30,
                  ),
                  borderColor: ColorManager.primary,
                  backGroundColor: ColorManager.primary,
                  textColor: ColorManager.white,
                  width: AppSize.s330,
                  height: AppSize.s52,
                  text: AppStrings.logIn,
                  fontWeight: FontWeight.bold,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                const HorizontalOrLine(
                  label: AppStrings.or,
                  height: AppSize.s60,
                ),
                DefaultTextButton(
                  borderColor: ColorManager.grey,
                  backGroundColor: ColorManager.white,
                  textColor: ColorManager.black,
                  width: AppSize.s330,
                  height: AppSize.s52,
                  text: AppStrings.signUpWithGoogle,
                  icon: const SizedBox(
                    height: AppSize.s33,
                    child: Image(
                      image: AssetImage(
                        ImageAssets.googleLogoIcon,
                      ),
                    ),
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                const SizedBox(
                  height: AppSize.s18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppStrings.doNotHaveAccount),
                    TextButton(
                      child: Text(
                        AppStrings.signUp,
                        style: TextStyle(
                          fontSize: AppSize.s18,
                          color: ColorManager.primary,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.toggleRoute,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
