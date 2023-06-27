import 'package:health_care/authentication/data/mapper/user_mapper.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';
import 'package:health_care/patient/data/response/appointments_response.dart';
import 'package:health_care/patient/data/response/patient_response.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/domain/model/patient_entities.dart';

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

extension AppointmentResponseMapper on AppointmentResponse? {
  Appointment toDomain() {
    return Appointment(
      this?.paid?.orFalse() ?? Constants.FALSE,
      this?.appointmentId?.orEmpty() ?? Constants.empty,
      this?.type?.orEmpty() ?? Constants.empty,
      this?.status?.orEmpty() ?? Constants.empty,
      this?.doctorId?.orEmpty() ?? Constants.empty,
      this?.patientId?.orEmpty() ?? Constants.empty,
      this?.date?.orEmpty() ?? Constants.empty,
      this?.v?.orZero() ?? Constants.zero,
      this?.price?.orZero() ?? Constants.zero,
    );
  }
}

extension AppointmentInfoResponseMapper on AppointmentInfoResponse? {
  AppointmentsInfo toDomain() {
    List<Appointment> allAppointmentsMapped =
        (this?.allAppointmentsResponseData?.map(
                      (appointments) => appointments.toDomain(),
                    ) ??
                const Iterable.empty())
            .cast<Appointment>()
            .toList();

    List<Appointment> availableAppointmentsMapped = (this
                ?.availableAppointmentsResponseData
                ?.map((availableAppointments) =>
                    availableAppointments.toDomain()) ??
            const Iterable.empty())
        .cast<Appointment>()
        .toList();

    List<Appointment> availableAppointmentsByDayMapped =
        (this?.availableAppointmentsByDayResponseData?.map(
                      (availableAppointmentsByDay) =>
                          availableAppointmentsByDay.toDomain(),
                    ) ??
                const Iterable.empty())
            .cast<Appointment>()
            .toList();

    return AppointmentsInfo(
      allAppointmentsMapped,
      availableAppointmentsMapped,
      availableAppointmentsByDayMapped,
    );
  }
}
