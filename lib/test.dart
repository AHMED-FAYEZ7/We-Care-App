import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/user_login_usecase.dart';
import 'package:health_care/chat/domain/usecase/get_all_messages_use_case.dart';
import 'package:health_care/chat/domain/usecase/get_messages_use_case.dart';
import 'package:health_care/chat/domain/usecase/send_message_use_case.dart';
import 'package:health_care/chat/domain/usecase/user_create_chat_use_case.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/domain/usecase/create_blog_use_case.dart';
import 'package:health_care/doctor/domain/usecase/create_comment_use_case.dart';
import 'package:health_care/doctor/domain/usecase/create_dislike_use_case.dart';
import 'package:health_care/doctor/domain/usecase/create_like_use_case.dart';
import 'package:health_care/doctor/domain/usecase/create_time_block_use_case.dart';
import 'package:health_care/doctor/domain/usecase/get_all_blogs_use_case.dart';
import 'package:health_care/doctor/domain/usecase/get_blogs_comments_use_case.dart';
import 'package:health_care/doctor/domain/usecase/get_blogs_likes_use_case.dart';
import 'package:health_care/doctor/domain/usecase/is_patient_examined_use_case.dart';
import 'package:health_care/patient/domain/usecase/book_appointment_use_case.dart';
import 'package:health_care/patient/domain/usecase/delete_review_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_all_doctors_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_docotrs_specialization_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_doctor_by_id_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_doctor_search_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_my_appointments_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_patient_data_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_rate_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_top_doctors_use_case.dart';
import 'package:health_care/patient/domain/usecase/make_doctor_review_use_case.dart';
import 'package:health_care/patient/domain/usecase/update_doctor_review_use_case.dart';

import 'patient/domain/usecase/get_available_appointment_by_day_use_case.dart';
import 'patient/domain/usecase/get_available_apponitments_for_doctor_use_case.dart';
import 'patient/domain/usecase/open_stripe_session_use_case.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);
  final AppPreferences _appPreferences = sl<AppPreferences>();

  final UserLoginUseCase _userLoginUseCase = sl<UserLoginUseCase>();
  final GetAllDoctorsUseCase _allDoctorsUseCase = sl<GetAllDoctorsUseCase>();
  final GetTopDoctorsUseCase _getTopDoctorsUseCase = sl<GetTopDoctorsUseCase>();
  final GetDoctorsSpecializationUseCase _getDoctorsSpecialization =
      sl<GetDoctorsSpecializationUseCase>();
  final GetDoctorByIdUseCase _byIdUseCase = sl<GetDoctorByIdUseCase>();
  final GetDoctorSearchUseCase _searchUseCase = sl<GetDoctorSearchUseCase>();
  final GetAvailableAppointmentsForDoctorUseCase
      _getAvailableAppointmentsForDoctorUseCase =
      sl<GetAvailableAppointmentsForDoctorUseCase>();
  final GetAvailableAppointmentsByDayUseCase _availableAppointmentsByDay =
      sl<GetAvailableAppointmentsByDayUseCase>();
  final BookAppointmentUseCase _bookAppointmentUseCase =
      sl<BookAppointmentUseCase>();
  final GetDoctorRateUseCase _getDoctorRateUseCase = sl<GetDoctorRateUseCase>();
  final MakeDoctorReviewUseCase _makeDoctorReviewUseCase =
      sl<MakeDoctorReviewUseCase>();
  final UpdateDoctorReviewUseCase _updateDoctorReviewUseCase =
      sl<UpdateDoctorReviewUseCase>();
  final DeleteReviewUseCase _deleteReviewUseCase = sl<DeleteReviewUseCase>();

  final CreateTimeBlockUseCase _createTimeBlockUseCase =
      sl<CreateTimeBlockUseCase>();
  final GetMyAppointmentsUseCase _getMyAppointmentsUseCase =
      sl<GetMyAppointmentsUseCase>();

  final UserCreateChatUseCase _userCreateChatUseCase =
      sl<UserCreateChatUseCase>();

  final CreateBlogUseCase _createBlogUseCase = sl<CreateBlogUseCase>();
  final GetAllBlogsUseCase _getAllBlogsUseCase = sl<GetAllBlogsUseCase>();
  final GetUserDataUseCase _getUserDataUseCase = sl<GetUserDataUseCase>();
  final CreateCommentUseCase _createCommentUseCase = sl<CreateCommentUseCase>();
  final GetBlogsCommentsUseCase _getBlogsCommentsUseCase =
      sl<GetBlogsCommentsUseCase>();
  final CreateLikeUseCase _createLikeUseCase = sl<CreateLikeUseCase>();
  final CreateDisLikeUseCase _createDisLikeUseCase = sl<CreateDisLikeUseCase>();
  final SendMessageUseCase _sendMessageUseCase = sl<SendMessageUseCase>();
  final GetAllChatsUseCase _getAllChatsUseCase = sl<GetAllChatsUseCase>();
  final GetMessagesUseCase _getMessagesUseCase = sl<GetMessagesUseCase>();
  final GetBlogsLikesUseCase _getBlogsLikesUseCase = sl<GetBlogsLikesUseCase>();
  final OpenStripeSessionUseCase _openStripeSessionUseCase =
      sl<OpenStripeSessionUseCase>();
  final IsPatientExaminedUseCase _isPatientExaminedUseCase =
      sl<IsPatientExaminedUseCase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          TextButton(
            onPressed: () async {
              // (await _connectToSocketUseCase.call(const NoParameters()));

              // (await _openStripeSessionUseCase.call("64a58861ba807d78e7fcc487"))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print(r.sessionData!.cancelUrl);
              //   print(r.sessionData!.stripeUrl);
              // });
              // (await _getAllChatsUseCase.call(
              //   const NoParameters(),
              // ))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print(r.chatInfo![0].membersList[0].name);
              //   print(r.chatInfo![1].membersList[1].name);
              //   print(r.results);
              // });
              (await _isPatientExaminedUseCase.call(
                IsPatientExaminedUseCaseInput(
                  appointmentId: "64b099edf76e067cacba5c27",
                  status: "accepted",
                ),
              ))
                  .fold((l) {
                print(l.message.toString());
              }, (r) {});
              // (await _bookAppointmentUseCase.call(
              //   BookAppointmentUseCaseInput(
              //     appointmentID: "64a703f21b3330b02853e3a4",
              //     // comment: "im tired boss",
              //   ),
              // ))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print(r.bookedAppointmentInfo!.doctorInfo!.specialization);
              // });
              // (await _createCommentUseCase.call(
              //   CreateCommentUseCaseInput(
              //     blogId: "643b4534a9b2cec52f141877",
              //     commentContent: "what is wrong",
              //   ),
              // ))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.commentData!.commentContent);
              // });
              // (await _getBlogsCommentsUseCase.call("643b4534a9b2cec52f141877"))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.commentData!.commentContent);
              //   print(r.blogComments![4].commentContent);
              // });
              // (await _getBlogsLikesUseCase.call("643b4534a9b2cec52f141877"))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print("test ${r.commentData!.commentContent}");
              //   print("comment ${r.blogLikes![0].commentId}");
              //   print("comment ${r.blogLikes![1].commentId}");
              //   print("comment ${r.blogLikes![2].commentId}");
              //   print("comment ${r.blogLikes![3].commentId}");
              //   print("comment ${r.blogLikes![4].commentId}");
              // });
              // (await _createLikeUseCase.call("643b4534a9b2cec52f141877")).fold(
              //     (l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print("test $r");
              // });
              // (await _createDisLikeUseCase.call("643b4534a9b2cec52f141877"))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print("test $r");
              // });
              // (await _userCreateChatUseCase.call("64564cc5061fd8d24c5ef612"))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.availableAppointmentsData![0].appointmentId);
              //   print(r.roomId);
              // });
              // (await _getAvailableAppointmentsForDoctorUseCase
              //         .call("64564cc5061fd8d24c5ef612"))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print(r.results);
              //   print(r.allAvailableAppointmentsInfo![0].appointmentId);
              //   print(r.availableAppointmentsByDayInfo);
              // });
              // (await _getMyAppointmentsUseCase.call(const NoParameters())).fold(
              //     (l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print(r.upcomingAppointmentsInfo![0].appointmentId);
              //   print(r.pastAppointmentInfo);
              //   print(r.upcomingAppointmentsInfo!.length);
              // });
              // (await _getAvailableAppointmentsForDoctorUseCase
              //         .call("64564cc5061fd8d24c5ef612"))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print(r.results);
              //   print(r.availableAppointmentsByDayInfo);
              //   print(r.allAvailableAppointmentsInfo![0].appointmentId);
              //   // print(r.reviews!.length);
              // });
              // (await _createBlogUseCase.call(
              //   CreateBlogUseCaseInput(
              //     postDescription: "this post 4 ",
              //     postTitle: "4 post",
              //     postImage:
              //         "data:image/jpeg;base64,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",
              //   ),
              // ))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.availableAppointmentsData![0].appointmentId);
              //   // print(r.reviews!.length);

              //   print(" message of create ${r.message}");
              //   print("create ${r.blogDataInfo!.blogDescription}");
              //   print("create ${r.blogDataInfo!.blogId}");
              //   print("create ${r.blogDataInfo!.blogId}");
              //   // print("all ${r.allBlogsData![0].blogId}");
              // });
              // (await _getAllBlogsUseCase.call(const NoParameters())).fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.availableAppointmentsData![0].appointmentId);
              //   // print(r.reviews!.length);

              // });

              // (await _getPatientDataUseCase.call(const NoParameters())).fold(
              //     (l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.availableAppointmentsData![0].appointmentId);
              //   // print(r.reviews!.length);

              //   print(r.user!.name);
              //   print(r.user!.id);
              //   // print(r.pastAppointment!.length);
              //   // print(r.upcomingAppointmentsData![0].appointmentId);
              //   // print(
              //   //     r.upcomingAppointmentsData![0].doctorInfo!.profilePicture);

              //   // print(r.user!.specialization);
              //   // print(r.user!.fees);
              //   // print(r.user!.scheduleTiming.length);
              //   // print("sss${r.token}");

              //   // print(r.doctorsData![1].name);
              //   // print(r.doctorsData![2].fees);
              //   // print(r.doctorsData![4].averageRating);
              //   // print(r.doctorsData![5].timePerPatient);
              // });

              // (await _allDoctorsUseCase.call("")).fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.availableAppointmentsData![0].appointmentId);
              //   // print(r.reviews!.length);

              // });

              _appPreferences.clearSharedPreferences();

              // (await _userLoginUseCase.call(
              //   UserLoginUseCaseInput(
              //     "mohamed-assem@gmail.com",
              //     "MOHAMED-ASSEM",
              //   ),
              // ))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print(r.user!.email);
              //   print(r.user!.specialization);
              //   print(r.user!.numberOfRating);
              //   print(r.token);
              //   _appPreferences.setToken(r.token);
              //   // print(r.user!.scheduleTiming[0].start);
              //   print(r.user!.id);
              //   print(r.user!.type);
              // });
            },
            child: const Text(
              "Login Call",
            ),
          ),
          // TextButton(
          //   onPressed: () {
          //     _userLoginUseCase.;
          //   },
          //   child: const Text(
          //     "fold",
          //   ),
          // ),
        ],
      ),
    );
  }
}
// hjhhjhj