import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

import '../../fonts/app_fonts.dart';
import '../styles/app_style.dart';

ThemeData getThemeDataLight() => ThemeData(
      scaffoldBackgroundColor: ColorManager.white,
      // main color of app
      primaryColor: ColorManager.primary,
      // primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1, // disable button
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
      // splashColor: ColorManager.primaryOpacity70, // ripple color

      // card view
      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),

      // appBar theme
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: ColorManager.white,
        elevation: AppSize.s0,
        titleSpacing: AppSize.s4,
        shadowColor: ColorManager.white,
        titleTextStyle: getBoldStyle(
          color: ColorManager.black,
          fontSize: AppSize.s16,
        ),
      ),

      // button theme
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        // splashColor: ColorManager.primaryOpacity70,
      ),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(color: ColorManager.white),
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12)),
        ),
      ),

      // text theme
      textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s16,
        ),
        displayMedium: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s16,
        ),
        displaySmall: getBoldStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s16,
        ),
        headlineMedium: getRegularStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s14,
        ),
        titleMedium: getMediumStyle(
          color: ColorManager.lightGrey,
          fontSize: FontSize.s14,
        ),
        titleSmall:
            getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s12),
        bodySmall: getRegularStyle(
          color: ColorManager.grey1,
        ),
        bodyLarge: getRegularStyle(
          color: ColorManager.grey,
        ),
        bodyMedium: getMediumStyle(color: ColorManager.black),
      ),

      // input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),

        // hint style
        hintStyle: getRegularStyle(color: ColorManager.grey1),

        // label style
        labelStyle: getMediumStyle(color: ColorManager.darkGrey),

        // error style
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),

        // focused border
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),

        // error border
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),

        // focused error border
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
      ),
      // icon Button theme
    );
