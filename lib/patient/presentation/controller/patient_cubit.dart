import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:health_care/patient/presentation/screens/appointment/appointment_screen.dart';
import 'package:health_care/patient/presentation/screens/history/history_screen.dart';
import 'package:health_care/patient/presentation/screens/home/home_screen.dart';
import 'package:health_care/patient/presentation/screens/profile/profile_screen.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());
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
    emit(AppChangeBottomNavStates());
  }
}
