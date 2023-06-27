part of 'patient_cubit.dart';

@immutable
abstract class PatientState {}

class PatientInitial extends PatientState {}

class AppChangeBottomNavState extends PatientState {}

//////////////////////////////////////
class GetTopDoctorLoadingState extends PatientState {}

class GetTopDoctorSuccessState extends PatientState {}

class GetTopDoctorFailureState extends PatientState {}

////////////////////////////////////////////
class GetAllDoctorLoadingState extends PatientState {}

class GetAllDoctorSuccessState extends PatientState {}

class GetAllDoctorFailureState extends PatientState {}
////////////////////////////////////////////
