part of 'doctor_cubit.dart';

abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class AppChangeBottomNavState extends DoctorState {}

//////////////////////////////////////
class GetDoctorDataLoadingState extends DoctorState {}

class GetDoctorDataSuccessState extends DoctorState {}

class GetDoctorDataFailureState extends DoctorState {}

////////////////////////////////////////////

class GetMyAppointmentsLoadingState extends DoctorState {}

class GetMyAppointmentsSuccessState extends DoctorState {}

class GetMyAppointmentsFailureState extends DoctorState {}
