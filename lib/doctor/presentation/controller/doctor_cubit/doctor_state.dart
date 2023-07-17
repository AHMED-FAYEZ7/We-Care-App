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

////////////////////////////////////////////

class CreateBlockLoadingState extends DoctorState {}

class CreateBlockSuccessState extends DoctorState {}

class CreateBlockFailureState extends DoctorState {
  final String error;

  CreateBlockFailureState({required this.error});
}

////////////////////////////////////////////

class IsExaminedLoadingState extends DoctorState {}

class IsExaminedSuccessState extends DoctorState {}

class IsExaminedFailureState extends DoctorState {}
