// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/authentication/domain/usecase/doctor_sinup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/patient_signup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/user_email_confirmation_usecase.dart';
import 'package:health_care/authentication/domain/usecase/user_forget_password_usecase.dart';
import 'package:health_care/authentication/domain/usecase/user_login_usecase.dart';
import 'package:health_care/authentication/domain/usecase/user_update_password_usecase.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/services/services_locator.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AppPreferences _appPreferences = sl<AppPreferences>();
  final DoctorSignUpUseCase _doctorSignUpUseCase;
  final PatientSignUpUseCase _patientSignUpUseCase;
  final UserLoginUseCase _userLoginUseCase;
  final UserForgetPasswordUseCase _userForgetPasswordUseCase;
  final UserEmailConfirmationUseCase _userEmailConfirmationUseCase;
  final UserUpdatePasswordUseCase _userUpdatePasswordUseCase;
  AuthCubit(
    this._doctorSignUpUseCase,
    this._patientSignUpUseCase,
    this._userLoginUseCase,
    this._userForgetPasswordUseCase,
    this._userEmailConfirmationUseCase,
    this._userUpdatePasswordUseCase,
  ) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  FutureOr<void> userLogin(UserLoginUseCaseInput loginUseCaseInput) async {
    emit(AuthLogInLoadingState());
    (await _userLoginUseCase.call(loginUseCaseInput)).fold((l) {
      emit(AuthLogInErrorState(error: l.message!));
    }, (r)  {
       _appPreferences.setToken(r.token);
      emit(AuthLogInSuccessState(userData: r));
    });
  }

}
