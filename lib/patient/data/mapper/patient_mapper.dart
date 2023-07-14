import 'package:health_care/authentication/data/mapper/user_mapper.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';
import 'package:health_care/patient/data/response/appointments_response.dart';
import 'package:health_care/patient/data/response/patient_response.dart';
import 'package:health_care/patient/data/response/payment_response.dart';
import 'package:health_care/patient/data/response/rate_response.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/domain/model/patient_entities.dart';
import 'package:health_care/patient/domain/model/payment_model.dart';
import 'package:health_care/patient/domain/model/rarte_model.dart';

extension DoctorInfoResponseMapper on DoctorInfResponse? {
  DoctorInfo toDomain() {
    int result = this?.resultsResponse?.orZero() ?? Constants.zero;
    int doctorsNum = this?.doctorsNumResponse?.orZero() ?? Constants.zero;

    List<User> allDoctorsDataMapped = (this?.allDoctorsResponse?.map(
                  (doctorResponse) => doctorResponse.toDomain(),
                ) ??
            const Iterable.empty())
        .cast<User>()
        .toList();

    List<User> doctorSearchDataMapped = (this
                ?.doctorsSearchDataResponse
                ?.map((doctorResponse) => doctorResponse.toDomain()) ??
            const Iterable.empty())
        .cast<User>()
        .toList();

    List<User> topDoctorDataMapped = (this?.topDoctorsDataResponse?.map(
                  (doctorResponse) => doctorResponse.toDomain(),
                ) ??
            const Iterable.empty())
        .cast<User>()
        .toList();
    List<User> doctorsSpecializationDataMapped =
        (this?.specializedDoctorsDataResponse?.map(
                      (doctorResponse) => doctorResponse.toDomain(),
                    ) ??
                const Iterable.empty())
            .cast<User>()
            .toList();

    return DoctorInfo(
      result,
      doctorsNum,
      allDoctorsDataMapped,
      doctorSearchDataMapped,
      topDoctorDataMapped,
      doctorsSpecializationDataMapped,
    );
  }
}

extension BaseAppointmentResponseMapper on BaseAppointmentResponse? {
  BaseAppointment toDomain() {
    return BaseAppointment(
      this?.appointmentId?.orEmpty() ?? Constants.empty,
      this?.type?.orEmpty() ?? Constants.empty,
      this?.status?.orEmpty() ?? Constants.empty,
      this?.paid?.orFalse() ?? Constants.FALSE,
      this?.date?.orEmpty() ?? Constants.empty,
      this?.comment?.orEmpty() ?? Constants.empty,
      this?.payTime?.orEmpty() ?? Constants.empty,
      this?.price?.orZero() ?? Constants.zero,
      this?.v?.orZero() ?? Constants.zero,
    );
  }
}

extension UserMyAppointmentsResponseMapper on UserMyAppointmentsResponse? {
  UserMyAppointments toDomain() {
    return UserMyAppointments(
      this?.doctorInfo?.toDomain(),
      this?.patientInfo?.toDomain(),
      this?.appointmentId?.orEmpty() ?? Constants.empty,
      this?.type?.orEmpty() ?? Constants.empty,
      this?.status?.orEmpty() ?? Constants.empty,
      this?.paid?.orFalse() ?? Constants.FALSE,
      this?.date?.orEmpty() ?? Constants.empty,
      this?.comment?.orEmpty() ?? Constants.empty,
      this?.payTime?.orEmpty() ?? Constants.empty,
      this?.price?.orZero() ?? Constants.zero,
      this?.v?.orZero() ?? Constants.zero,
    );
  }
}

extension MyAppointmentsResponseMapper on MyAppointmentsResponse? {
  MyAppointments toDomain() {
    return MyAppointments(
      this?.results?.orZero() ?? Constants.zero,
      (this?.pastAppointmentInfo?.map(
                    (appointments) => appointments.toDomain(),
                  ) ??
              const Iterable.empty())
          .cast<UserMyAppointments>()
          .toList(),
      (this?.upcomingAppointmentsInfo?.map(
                    (appointments) => appointments.toDomain(),
                  ) ??
              const Iterable.empty())
          .cast<UserMyAppointments>()
          .toList(),
    );
  }
}

extension AllDoctorAppointmentsResponseMapper
    on AllDoctorAppointmentsResponse? {
  AllDoctorAppointments toDomain() {
    return AllDoctorAppointments(
      this?.results?.orZero() ?? Constants.zero,
      (this?.allAppointmentsInfo?.map(
                    (appointments) => appointments.toDomain(),
                  ) ??
              const Iterable.empty())
          .cast<BaseAllDoctorAppointments>()
          .toList(),
    );
  }
}

extension AvailableAppointmentsResponseMapper
    on AvailableAppointmentsResponse? {
  AvailableAppointments toDomain() {
    return AvailableAppointments(
      this?.results?.orZero() ?? Constants.zero,
      (this?.availableAppointmentsInfo?.map(
                    (appointments) => appointments.toDomain(),
                  ) ??
              const Iterable.empty())
          .cast<BaseAppointment>()
          .toList(),
      (this?.availableAppointmentsByDayInfo?.map(
                    (appointments) => appointments.toDomain(),
                  ) ??
              const Iterable.empty())
          .cast<BaseAppointment>()
          .toList(),
    );
  }
}

extension BaseAllDoctorAppointmentsResponseMapper
    on BaseAllDoctorAppointmentsResponse? {
  BaseAllDoctorAppointments toDomain() {
    return BaseAllDoctorAppointments(
      this?.patientId?.orEmpty() ?? Constants.empty,
      this?.appointmentId?.orEmpty() ?? Constants.empty,
      this?.type?.orEmpty() ?? Constants.empty,
      this?.status?.orEmpty() ?? Constants.empty,
      this?.paid?.orFalse() ?? Constants.FALSE,
      this?.date?.orEmpty() ?? Constants.empty,
      this?.comment?.orEmpty() ?? Constants.empty,
      this?.payTime?.orEmpty() ?? Constants.empty,
      this?.price?.orZero() ?? Constants.zero,
      this?.v?.orZero() ?? Constants.zero,
    );
  }
}

extension BookedAppointmentResponseMapper on BookedAppointmentResponse? {
  BookedAppointment toDomain() {
    return BookedAppointment(
      this?.bookedAppointmentInfo?.toDomain(),
    );
  }
}

/////////// rate //////////
extension RateResponseMapper on RateResponse? {
  Rate toDomain() {
    return Rate(
      this?.reviewId?.orEmpty() ?? Constants.empty,
      this?.rating?.orZero() ?? Constants.zero,
      this?.comment?.orEmpty() ?? Constants.empty,
      this?.createdAt?.orEmpty() ?? Constants.empty,
      this?.updatedAt?.orEmpty() ?? Constants.empty,
      this?.v?.orZero() ?? Constants.zero,
      this?.patient?.toDomain(),
      this?.doctor?.toDomain(),
    );
  }
}

extension RateInfoResponseMapper on RateInfoResponse? {
  RateInfo toDomain() {
    int reviewsNum = this?.reviewsNum?.orZero() ?? Constants.zero;
    int results = this?.results?.orZero() ?? Constants.zero;
    String successMessage = this?.successMessage?.orEmpty() ?? Constants.empty;
    List<Rate> reviewsMapped = (this?.reviews?.map(
                  (reviews) => reviews.toDomain(),
                ) ??
            const Iterable.empty())
        .cast<Rate>()
        .toList();

    return RateInfo(
      reviewsNum,
      results,
      successMessage,
      reviewsMapped,
    );
  }
}

extension BaseSessionResponseMapper on BaseSessionResponse? {
  BaseSession toDomain() {
    return BaseSession(
      this?.sessionId?.orEmpty() ?? Constants.empty,
      this?.objectType?.orEmpty() ?? Constants.empty,
      this?.subtotalAmount?.orZero() ?? Constants.zero,
      this?.totalAmount?.orZero() ?? Constants.zero,
      this?.cancelUrl?.orEmpty() ?? Constants.empty,
      this?.successUrl?.orEmpty() ?? Constants.empty,
      this?.clientReferenceId?.orEmpty() ?? Constants.empty,
      this?.customerEmail?.orEmpty() ?? Constants.empty,
      this?.currencyType?.orEmpty() ?? Constants.empty,
      this?.stripeUrl?.orEmpty() ?? Constants.empty,
    );
  }
}

extension SessionResponseMapper on SessionResponse? {
  SessionModel toDomain() {
    return SessionModel(
      this?.sessionResponse?.toDomain(),
    );
  }
}
