import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:health_care/patient/presentation/screens/patient_appointment/patient_appointment_screen.dart';
import 'package:health_care/patient/presentation/screens/patient_history/patient_history_screen.dart';
import 'package:health_care/patient/presentation/screens/patient_home/patient_home_screen.dart';
import 'package:health_care/patient/presentation/screens/patient_profile/patient_profile_screen.dart';

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
    const PatientHomeScreen(),
    const PatientAppointmentScreen(),
    const PatientHistoryScreen(),
    const PatientProfileScreen(),
  ];

  int currentIndex = 0;
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavStates());
  }
}
