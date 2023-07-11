part of 'doctor_cubit.dart';

abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class AppChangeBottomNavState extends DoctorState {}

//////////////////////////////////////
class GetDoctorDataLoadingState extends DoctorState {}

class GetDoctorDataSuccessState extends DoctorState {}

class GetDoctorDataFailureState extends DoctorState {}
////////////////////////////////////////////

class GetAllBlogsLoadingState extends DoctorState {}

class GetAllBlogsSuccessState extends DoctorState {}

class GetAllBlogsFailureState extends DoctorState {}

////////////////////////////////////////////
class CreatePostLoadingState extends DoctorState {}

class CreatePostSuccessState extends DoctorState {}

class CreatePostFailureState extends DoctorState {}

////////////////////////////////////////////

class GetMyAppointmentsLoadingState extends DoctorState {}

class GetMyAppointmentsSuccessState extends DoctorState {}

class GetMyAppointmentsFailureState extends DoctorState {}
