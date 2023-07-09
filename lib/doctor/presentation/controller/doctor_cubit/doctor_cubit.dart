import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/presentation/screens/appointments/appointment_screen.dart';
import 'package:health_care/doctor/presentation/screens/home/home_screen.dart';
import 'package:health_care/doctor/presentation/screens/posts/posts_sceen.dart';
import 'package:health_care/doctor/presentation/screens/profile/profile_screen.dart';
import 'package:health_care/patient/domain/usecase/get_patient_data_use_case.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  GetUserDataUseCase _getUserDataUseCase = sl<GetUserDataUseCase>();

  DoctorCubit(
    this._getUserDataUseCase,
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
    const PostsDoctorScreen(),
    const AppointmentDoctorScreen(),
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
}
