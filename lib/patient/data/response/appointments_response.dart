// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:health_care/core/response/base_response.dart';

part 'appointments_response.g.dart';

@JsonSerializable()
class AppointmentResponse {
  @JsonKey(name: "paid")
  bool? paid;
  @JsonKey(name: "_id")
  String? appointmentId;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "doctor")
  String? doctorId;
  @JsonKey(name: "patient")
  String? patientId;
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "price")
  int? price;

  AppointmentResponse(
    this.paid,
    this.appointmentId,
    this.type,
    this.status,
    this.doctorId,
    this.patientId,
    this.date,
    this.v,
    this.price,
  );

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentResponseToJson(this);
}

@JsonSerializable()
class AppointmentInfoResponse extends BaseResponse {
  @JsonKey(name: "allAppointments")
  List<AppointmentResponse>? allAppointmentsResponseData;

  @JsonKey(name: "availableAppointments")
  List<AppointmentResponse>? availableAppointmentsResponseData;

  @JsonKey(name: "availableAppointmentsByDay")
  List<AppointmentResponse>? availableAppointmentsByDayResponseData;

  @JsonKey(name: "appointment")
  AppointmentResponse? bookedAppointmentResponseData;

  factory AppointmentInfoResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('allAppointments')) {
      return _$AppointmentInfoResponseFromJson(json);
    } else if (json.containsKey('availableAppointments')) {
      return _$AppointmentInfoResponseFromJson(json);
    } else if (json.containsKey('availableAppointmentsByDay')) {
      return _$AppointmentInfoResponseFromJson(json);
    } else if (json.containsKey('appointment')) {
      return _$AppointmentInfoResponseFromJson(json);
    } else {
      throw ArgumentError('Invalid JSON structure for AllDoctorsResponse');
    }
  }

  @override
  Map<String, dynamic> toJson() => _$AppointmentInfoResponseToJson(this);

  AppointmentInfoResponse(
    super.status,
    super.message,
    this.allAppointmentsResponseData,
    this.availableAppointmentsResponseData,
    this.availableAppointmentsByDayResponseData,
    this.bookedAppointmentResponseData,
  );
}
