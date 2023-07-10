// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:health_care/core/response/base_response.dart';

part 'appointments_response.g.dart';

@JsonSerializable()
class BaseAppointmentResponse {
  @JsonKey(name: "_id")
  String? appointmentId;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "paid")
  bool? paid;

  @JsonKey(name: "date")
  String? date;

  @JsonKey(name: "comment")
  String? comment;

  @JsonKey(name: "payTime")
  String? payTime;

  @JsonKey(name: "price")
  int? price;

  @JsonKey(name: "__v")
  int? v;

  BaseAppointmentResponse(
    this.appointmentId,
    this.type,
    this.status,
    this.paid,
    this.date,
    this.comment,
    this.payTime,
    this.price,
    this.v,
  );

  factory BaseAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseAppointmentResponseToJson(this);
}

@JsonSerializable()
class UserMyAppointmentsResponse extends BaseAppointmentResponse {
  @JsonKey(name: "doctor")
  UserResponse? doctorInfo;

  @JsonKey(name: "patient")
  UserResponse? patientInfo;

  UserMyAppointmentsResponse(
    this.doctorInfo,
    this.patientInfo,
    super.appointmentId,
    super.type,
    super.status,
    super.paid,
    super.date,
    super.comment,
    super.payTime,
    super.price,
    super.v,
  );

  factory UserMyAppointmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserMyAppointmentsResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UserMyAppointmentsResponseToJson(this);
}

@JsonSerializable()
class MyAppointmentsResponse extends BaseResponse {
  @JsonKey(name: "results")
  int? results;

  @JsonKey(name: "pastAppointment")
  List<MyAppointmentsResponse>? pastAppointmentInfo;

  @JsonKey(name: "upcomingApointments")
  List<MyAppointmentsResponse>? upcomingAppointmentsInfo;

  MyAppointmentsResponse(
    this.results,
    this.pastAppointmentInfo,
    this.upcomingAppointmentsInfo,
    super.status,
    super.message,
  );

  factory MyAppointmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$MyAppointmentsResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MyAppointmentsResponseToJson(this);
}

@JsonSerializable()
class BaseAllDoctorAppointmentsResponse extends BaseAppointmentResponse {
  @JsonKey(name: "patient")
  String? patientId;

  BaseAllDoctorAppointmentsResponse(
    this.patientId,
    super.appointmentId,
    super.type,
    super.status,
    super.paid,
    super.date,
    super.comment,
    super.payTime,
    super.price,
    super.v,
  );

  factory BaseAllDoctorAppointmentsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BaseAllDoctorAppointmentsResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() =>
      _$BaseAllDoctorAppointmentsResponseToJson(this);
}

@JsonSerializable()
class AllDoctorAppointmentsResponse extends BaseResponse {
  @JsonKey(name: "results")
  int? results;

  @JsonKey(name: "allAppointments")
  List<BaseAllDoctorAppointmentsResponse>? allAppointmentsInfo;

  AllDoctorAppointmentsResponse(
    this.results,
    this.allAppointmentsInfo,
    super.status,
    super.message,
  );

  factory AllDoctorAppointmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllDoctorAppointmentsResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AllDoctorAppointmentsResponseToJson(this);
}

@JsonSerializable()
class AvailableAppointmentsResponse extends BaseResponse {
  @JsonKey(name: "results")
  int? results;

  @JsonKey(name: "availableAppointments")
  List<BaseAppointmentResponse>? availableAppointmentsInfo;

  @JsonKey(name: "availableAppointmentsByDay")
  List<BaseAppointmentResponse>? availableAppointmentsByDayInfo;

  AvailableAppointmentsResponse(
    this.results,
    this.availableAppointmentsInfo,
    this.availableAppointmentsByDayInfo,
    super.status,
    super.message,
  );

  factory AvailableAppointmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailableAppointmentsResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AvailableAppointmentsResponseToJson(this);
}

@JsonSerializable()
class BaseBookedAppointmentResponse extends UserMyAppointmentsResponse {
  BaseBookedAppointmentResponse(
    super.doctorInfo,
    super.patientInfo,
    super.appointmentId,
    super.type,
    super.status,
    super.paid,
    super.date,
    super.comment,
    super.payTime,
    super.price,
    super.v,
  );

  factory BaseBookedAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseBookedAppointmentResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BaseBookedAppointmentResponseToJson(this);
}

@JsonSerializable()
class BookedAppointmentResponse extends BaseResponse {
  @JsonKey(name: "appointment")
  UserMyAppointmentsResponse? bookedAppointmentInfo;

  BookedAppointmentResponse(
    this.bookedAppointmentInfo,
    super.status,
    super.message,
  );

  factory BookedAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$BookedAppointmentResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BookedAppointmentResponseToJson(this);
}
