import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/patient/domain/model/patient_entities.dart';
import 'package:health_care/patient/domain/usecase/get_all_doctors_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_top_doctors_use_case.dart';
import 'package:health_care/patient/presentation/screens/appointment/appointment_screen.dart';
import 'package:health_care/patient/presentation/screens/history/history_screen.dart';
import 'package:health_care/patient/presentation/screens/home/home_screen.dart';
import 'package:health_care/patient/presentation/screens/profile/profile_screen.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  GetTopDoctorsUseCase _getTopDoctorsUseCase = sl<GetTopDoctorsUseCase>();

  GetAllDoctorsUseCase _allDoctorsUseCase = sl<GetAllDoctorsUseCase>();

  PatientCubit(
    this._getTopDoctorsUseCase,
    this._allDoctorsUseCase,
  ) : super(PatientInitial());
  static PatientCubit get(context) => BlocProvider.of(context);

  List<String> titles = [
    'We Care',
    'My Appointments',
    'History',
    'profile',
  ];

  List<Widget> screens = [
    const HomePatientScreen(),
    const AppointmentPatientScreen(),
    const HistoryPatientScreen(),
    const ProfilePatientScreen(),
  ];

  int currentIndex = 0;
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  /////////////////////////////
  List<User> allDoctor = [];
  getAllDoctor(String specialist) async {
    emit(GetAllDoctorLoadingState());
    allDoctor = [];
    (await _allDoctorsUseCase.call(specialist)).fold(
      (l) {
        emit(GetTopDoctorFailureState());
      },
      (r) {
        allDoctor = r.allDoctorsData!;
        emit(GetAllDoctorSuccessState());
      },
    );
  }

/////////////////////////////
  List<User> topDoctor = [];
  getTopDoctor(String specialist) async {
    emit(GetTopDoctorLoadingState());
    topDoctor = [];
    (await _getTopDoctorsUseCase.call(specialist)).fold(
      (l) {
        emit(GetTopDoctorFailureState());
      },
      (r) {
        topDoctor = r.topDoctorsData!;
        emit(GetTopDoctorSuccessState());
      },
    );
  }
}
