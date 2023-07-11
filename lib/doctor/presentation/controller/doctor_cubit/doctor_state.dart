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
////////////////////////////////////////////

class CreateLikeLoadingState extends DoctorState {}

class CreateLikeSuccessState extends DoctorState {}

class CreateLikeFailureState extends DoctorState {}
////////////////////////////////////////////

class CreateDisLikeLoadingState extends DoctorState {}

class CreateDisLikeSuccessState extends DoctorState {}

class CreateDisLikeFailureState extends DoctorState {}

////////////////////////////////////////////
class CreateCommentLoadingState extends DoctorState {}

class CreateCommentSuccessState extends DoctorState {}

class CreateCommentFailureState extends DoctorState {}

////////////////////////////////////////////

class GetAllLikesLoadingState extends DoctorState {}

class GetAllLikesSuccessState extends DoctorState {}

class GetAllLikesFailureState extends DoctorState {}

////////////////////////////////////////////

class GetAllCommentsLoadingState extends DoctorState {}

class GetAllCommentsSuccessState extends DoctorState {}

class GetAllCommentsFailureState extends DoctorState {}
