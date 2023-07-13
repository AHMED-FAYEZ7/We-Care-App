import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/domain/model/blog_model.dart';
import 'package:health_care/doctor/domain/model/comments_likes_model.dart';
import 'package:health_care/doctor/domain/usecase/create_blog_use_case.dart';
import 'package:health_care/doctor/domain/usecase/create_comment_use_case.dart';
import 'package:health_care/doctor/domain/usecase/create_dislike_use_case.dart';
import 'package:health_care/doctor/domain/usecase/create_like_use_case.dart';
import 'package:health_care/doctor/domain/usecase/create_time_block_use_case.dart';
import 'package:health_care/doctor/domain/usecase/get_all_blogs_use_case.dart';
import 'package:health_care/doctor/domain/usecase/get_blogs_comments_use_case.dart';
import 'package:health_care/doctor/domain/usecase/get_blogs_likes_use_case.dart';
import 'package:health_care/doctor/presentation/screens/appointments/appointment_screen.dart';
import 'package:health_care/doctor/presentation/screens/home/home_screen.dart';
import 'package:health_care/post/presentation/screen/posts/posts_sceen.dart';
import 'package:health_care/doctor/presentation/screens/profile/profile_screen.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/domain/usecase/get_my_appointments_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_patient_data_use_case.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  GetUserDataUseCase _getUserDataUseCase = sl<GetUserDataUseCase>();
  CreateTimeBlockUseCase _createTimeBlockUseCase = sl<CreateTimeBlockUseCase>();

  GetMyAppointmentsUseCase _getMyAppointmentsUseCase =
      sl<GetMyAppointmentsUseCase>();

  DoctorCubit(
    this._getUserDataUseCase,
    this._createTimeBlockUseCase,
    this._getMyAppointmentsUseCase,
  ) : super(DoctorInitial());

  static DoctorCubit get(context) => BlocProvider.of(context);

  List<String> titles = [
    'We Care',
    'Feeds',
    'My Appointments',
    'profile',
  ];

  List<Widget> screens = [
    HomeDoctorScreen(),
    PostsScreen(),
    AppointmentDoctorScreen(),
    const ProfileDoctorScreen(),
  ];

  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  /////////////doctor data////////////////
  User? doctorData;

  getDoctorData(NoParameters params) async {
    emit(GetDoctorDataLoadingState());
    (await _getUserDataUseCase.call(params)).fold(
      (l) {
        emit(GetDoctorDataFailureState());
      },
      (r) {
        doctorData = r.user;
        emit(GetDoctorDataSuccessState());
      },
    );
  }

  /////////////get my appointment////////////////
  List<UserMyAppointments> upcomingAppointments = [];
  List<UserMyAppointments> pastAppointments = [];

  getMyAppointments(NoParameters params) async {
    emit(GetMyAppointmentsLoadingState());

    (await _getMyAppointmentsUseCase.call(params)).fold(
      (l) {
        emit(GetMyAppointmentsFailureState());
      },
      (r) {
        upcomingAppointments = [];
        pastAppointments = [];
        upcomingAppointments = r.upcomingAppointmentsInfo!;
        pastAppointments = r.pastAppointmentInfo!;
        emit(GetMyAppointmentsSuccessState());
      },
    );
  }

  /////////////get my appointment////////////////

  createTimeBlock(
    int period,
    String startTime,
    String type,
  ) async {
    emit(CreateBlockLoadingState());

    (await _createTimeBlockUseCase.call(
      CreateTimeBlockUseCaseInput(
        period: period,
        startTime: startTime,
        callType: type,
      ),
    ))
        .fold(
      (l) {
        emit(CreateBlockFailureState(error: l.message!));
      },
      (r) {
        emit(CreateBlockSuccessState());
      },
    );
  }
}
