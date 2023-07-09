// ignore_for_file: prefer_final_fields

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/domain/model/rarte_model.dart';
import 'package:health_care/patient/domain/usecase/book_appointment_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_all_doctors_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_available_appointment_by_day_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_doctor_search_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_my_appointments_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_patient_data_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_rate_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_top_doctors_use_case.dart';
import 'package:health_care/patient/domain/usecase/make_doctor_review_use_case.dart';
import 'package:health_care/patient/presentation/screens/appointment/appointment_screen.dart';
import 'package:health_care/patient/presentation/screens/home/home_screen.dart';
import 'package:health_care/patient/presentation/screens/posts/posts_screen.dart';
import 'package:health_care/patient/presentation/screens/profile/profile_screen.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  GetTopDoctorsUseCase _getTopDoctorsUseCase = sl<GetTopDoctorsUseCase>();

  GetAllDoctorsUseCase _allDoctorsUseCase = sl<GetAllDoctorsUseCase>();
  GetDoctorSearchUseCase _getDoctorSearchUseCase = sl<GetDoctorSearchUseCase>();
  GetAvailableAppointmentsByDayUseCase _availableAppointmentsByDayUseCase =
      sl<GetAvailableAppointmentsByDayUseCase>();
  BookAppointmentUseCase _bookAppointmentUseCase = sl<BookAppointmentUseCase>();
  GetDoctorRateUseCase _getDoctorRateUseCase = sl<GetDoctorRateUseCase>();
  MakeDoctorReviewUseCase _makeDoctorReviewUseCase =
      sl<MakeDoctorReviewUseCase>();

  GetMyAppointmentsUseCase _getMyAppointmentsUseCase =
      sl<GetMyAppointmentsUseCase>();

  GetUserDataUseCase _getUserDataUseCase = sl<GetUserDataUseCase>();

  PatientCubit(
    this._getTopDoctorsUseCase,
    this._allDoctorsUseCase,
    this._getDoctorSearchUseCase,
    this._availableAppointmentsByDayUseCase,
    this._bookAppointmentUseCase,
    this._getDoctorRateUseCase,
    this._makeDoctorReviewUseCase,
    this._getMyAppointmentsUseCase,
    this._getUserDataUseCase,
  ) : super(PatientInitial());

  static PatientCubit get(context) => BlocProvider.of(context);

  List<String> titles = [
    'We Care',
    'Feeds',
    'My Appointments',
    'profile',
  ];

  List<Widget> screens = [
    const HomePatientScreen(),
    const PostsPatientScreen(),
    AppointmentPatientScreen(),
    const ProfilePatientScreen(),
  ];

  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  /////////////user data////////////////
  User? patientData;

  getPatientData(NoParameters params) async {
    emit(GetPatientDataLoadingState());
    (await _getUserDataUseCase.call(params)).fold(
      (l) {
        emit(GetPatientDataFailureState());
      },
      (r) {
        patientData = r.user;
        emit(GetPatientDataSuccessState());
      },
    );
  }

  /////////////all doctor////////////////

  List<User> allDoctor = [];

  getAllDoctor(String specialist) async {
    emit(GetAllDoctorLoadingState());
    allDoctor = [];
    (await _allDoctorsUseCase.call(specialist)).fold(
      (l) {
        emit(GetAllDoctorFailureState());
      },
      (r) {
        allDoctor = r.allDoctorsData!;
        emit(GetAllDoctorSuccessState());
      },
    );
  }

  ///////////top doctor//////////////////

  List<User> topDoctor = [];
  List<User> specialistTopDoctor = [];
  bool isAllTop = false;

  getTopDoctor({String? specialist}) async {
    emit(GetTopDoctorLoadingState());
    specialistTopDoctor = [];

    final useCase = specialist != null
        ? _getTopDoctorsUseCase.call(input: specialist)
        : _getTopDoctorsUseCase.call();

    (await useCase).fold(
      (l) {
        emit(GetTopDoctorFailureState());
      },
      (r) {
        if (specialist == null) {
          topDoctor = r.topDoctorsData!;
        } else if (specialist == "All") {
          isAllTop = false;
        } else {
          specialistTopDoctor = r.topDoctorsData!;
          isAllTop = true;
        }
        emit(GetTopDoctorSuccessState());
      },
    );
  }

  /////////////searched doctor////////////////

  List<User> searchedDoctor = [];
  bool isSearched = false;

  getSearchedDoctor({String? keyword, String? specialist}) async {
    emit(GetSearchedDoctorLoadingState());
    searchedDoctor = [];
    isSearched = true;
    final useCase = specialist != null
        ? _getDoctorSearchUseCase.call(
            TwoParametersUseCase(keyword!, specialist),
          )
        : _getDoctorSearchUseCase.call(TwoParametersUseCase(keyword!));
    (await useCase).fold(
      (l) {
        emit(GetSearchedDoctorFailureState());
      },
      (r) {
        searchedDoctor = r.doctorsSearchData!;

        emit(GetSearchedDoctorSuccessState());
      },
    );
  }

/////////////available appointment by day////////////////

  List<Appointment> availableAppointmentsByDayData = [];

  getAvailableAppointmentByDay(String docId, String date) async {
    emit(GetAvailableAppointmentByDayLoadingState());
    availableAppointmentsByDayData = [];
    (await _availableAppointmentsByDayUseCase.call(
      TwoParametersUseCase(
        docId,
        date,
      ),
    ))
        .fold((l) {
      emit(GetAvailableAppointmentByDayFailureState());
    }, (r) {
      availableAppointmentsByDayData = r.availableAppointmentsByDayData!;
      emit(GetAvailableAppointmentByDaySuccessState());
    });
  }

/////////////book appointment////////////////

  bookAppointment(String appointmentId) async {
    emit(BookAppointmentByIdLoadingState());
    (await _bookAppointmentUseCase.call(appointmentId)).fold(
      (l) {
        emit(BookAppointmentByIdFailureState());
      },
      (r) {
        emit(BookAppointmentByIdSuccessState());
      },
    );
  }

  /////////////get my appointment////////////////
  List<Appointment> upcomingAppointments = [];
  List<Appointment> pastAppointments = [];

  getMyAppointments(NoParameters params) async {
    emit(GetMyAppointmentsLoadingState());
    upcomingAppointments = [];
    pastAppointments = [];
    (await _getMyAppointmentsUseCase.call(params)).fold(
      (l) {
        emit(GetMyAppointmentsFailureState());
      },
      (r) {
        upcomingAppointments = r.upcomingAppointmentsData!;
        pastAppointments = r.pastAppointment!;
        emit(GetMyAppointmentsSuccessState());
      },
    );
  }

  /////////////get reviews////////////////

  List<Rate> rateList = [];

  getDoctorRate(String doctorId) async {
    emit(GetDoctorRateLoadingState());
    rateList = [];
    (await _getDoctorRateUseCase.call(doctorId)).fold(
      (l) {
        emit(GetDoctorRateFailureState());
      },
      (r) {
        rateList = r.reviews!;
        emit(GetDoctorRateSuccessState());
      },
    );
  }

/////////////post reviews////////////////

  makeDoctorReview(
    String doctorId,
    int rating,
    String comment,
  ) async {
    emit(MakeDoctorReviewLoadingState());
    (await _makeDoctorReviewUseCase.call(
      MakeRateInputUseCase(
        doctorId: doctorId,
        rating: rating,
        comment: comment,
      ),
    ))
        .fold(
      (l) {
        emit(MakeDoctorReviewFailureState());
      },
      (r) {
        emit(MakeDoctorReviewSuccessState());
      },
    );
  }

/////////////post reviews////////////////
}
