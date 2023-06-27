// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponse _$AppointmentResponseFromJson(Map<String, dynamic> json) =>
    AppointmentResponse(
      json['paid'] as bool?,
      json['_id'] as String?,
      json['type'] as String?,
      json['status'] as String?,
      json['doctor'] as String?,
      json['patient'] as String?,
      json['date'] as String?,
      json['__v'] as int?,
      json['price'] as int?,
    );

Map<String, dynamic> _$AppointmentResponseToJson(
        AppointmentResponse instance) =>
    <String, dynamic>{
      'paid': instance.paid,
      '_id': instance.appointmentId,
      'type': instance.type,
      'status': instance.status,
      'doctor': instance.doctorId,
      'patient': instance.patientId,
      'date': instance.date,
      '__v': instance.v,
      'price': instance.price,
    };

AppointmentInfoResponse _$AppointmentInfoResponseFromJson(
        Map<String, dynamic> json) =>
    AppointmentInfoResponse(
      json['status'] as String?,
      json['message'] as String?,
      (json['allAppointments'] as List<dynamic>?)
          ?.map((e) => AppointmentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['availableAppointments'] as List<dynamic>?)
          ?.map((e) => AppointmentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['availableAppointmentsByDay'] as List<dynamic>?)
          ?.map((e) => AppointmentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppointmentInfoResponseToJson(
        AppointmentInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'allAppointments': instance.allAppointmentsResponseData,
      'availableAppointments': instance.availableAppointmentsResponseData,
      'availableAppointmentsByDay':
          instance.availableAppointmentsByDayResponseData,
    };
