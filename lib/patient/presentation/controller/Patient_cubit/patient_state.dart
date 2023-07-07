part of 'patient_cubit.dart';

@immutable
abstract class PatientState {}

class PatientInitial extends PatientState {}

class AppChangeBottomNavState extends PatientState {}
//////////////////////////////////////
class GetPatientDataLoadingState extends PatientState {}

class GetPatientDataSuccessState extends PatientState {}

class GetPatientDataFailureState extends PatientState {}

//////////////////////////////////////
class GetTopDoctorLoadingState extends PatientState {}

class GetTopDoctorSuccessState extends PatientState {}

class GetTopDoctorFailureState extends PatientState {}

////////////////////////////////////////////
class GetAllDoctorLoadingState extends PatientState {}

class GetAllDoctorSuccessState extends PatientState {}

class GetAllDoctorFailureState extends PatientState {}

////////////////////////////////////////////
class GetSearchedDoctorLoadingState extends PatientState {}

class GetSearchedDoctorSuccessState extends PatientState {}

class GetSearchedDoctorFailureState extends PatientState {}
////////////////////////////////////////////

class GetAvailableAppointmentByDayLoadingState extends PatientState {}

class GetAvailableAppointmentByDaySuccessState extends PatientState {}

class GetAvailableAppointmentByDayFailureState extends PatientState {}

////////////////////////////////////////////
class BookAppointmentByIdLoadingState extends PatientState {}

class BookAppointmentByIdSuccessState extends PatientState {}

class BookAppointmentByIdFailureState extends PatientState {}
////////////////////////////////////////////

class GetMyAppointmentsLoadingState extends PatientState {}

class GetMyAppointmentsSuccessState extends PatientState {}

class GetMyAppointmentsFailureState extends PatientState {}

////////////////////////////////////////////
class GetDoctorRateLoadingState extends PatientState {}

class GetDoctorRateSuccessState extends PatientState {}

class GetDoctorRateFailureState extends PatientState {}

////////////////////////////////////////////
class MakeDoctorReviewLoadingState extends PatientState {}

class MakeDoctorReviewSuccessState extends PatientState {}

class MakeDoctorReviewFailureState extends PatientState {}
////////////////////////////////////////////
