// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseAppointmentResponse _$BaseAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    BaseAppointmentResponse(
      json['_id'] as String?,
      json['type'] as String?,
      json['status'] as String?,
      json['paid'] as bool?,
      json['date'] as String?,
      json['comment'] as String?,
      json['payTime'] as String?,
      json['price'] as int?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$BaseAppointmentResponseToJson(
        BaseAppointmentResponse instance) =>
    <String, dynamic>{
      '_id': instance.appointmentId,
      'type': instance.type,
      'status': instance.status,
      'paid': instance.paid,
      'date': instance.date,
      'comment': instance.comment,
      'payTime': instance.payTime,
      'price': instance.price,
      '__v': instance.v,
    };

UserMyAppointmentsResponse _$UserMyAppointmentsResponseFromJson(
        Map<String, dynamic> json) =>
    UserMyAppointmentsResponse(
      json['doctor'] == null
          ? null
          : UserResponse.fromJson(json['doctor'] as Map<String, dynamic>),
      json['patient'] == null
          ? null
          : UserResponse.fromJson(json['patient'] as Map<String, dynamic>),
      json['_id'] as String?,
      json['type'] as String?,
      json['status'] as String?,
      json['paid'] as bool?,
      json['date'] as String?,
      json['comment'] as String?,
      json['payTime'] as String?,
      json['price'] as int?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$UserMyAppointmentsResponseToJson(
        UserMyAppointmentsResponse instance) =>
    <String, dynamic>{
      '_id': instance.appointmentId,
      'type': instance.type,
      'status': instance.status,
      'paid': instance.paid,
      'date': instance.date,
      'comment': instance.comment,
      'payTime': instance.payTime,
      'price': instance.price,
      '__v': instance.v,
      'doctor': instance.doctorInfo,
      'patient': instance.patientInfo,
    };

MyAppointmentsResponse _$MyAppointmentsResponseFromJson(
        Map<String, dynamic> json) =>
    MyAppointmentsResponse(
      json['results'] as int?,
      (json['pastAppointment'] as List<dynamic>?)
          ?.map(
              (e) => MyAppointmentsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['upcomingApointments'] as List<dynamic>?)
          ?.map(
              (e) => MyAppointmentsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$MyAppointmentsResponseToJson(
        MyAppointmentsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'results': instance.results,
      'pastAppointment': instance.pastAppointmentInfo,
      'upcomingApointments': instance.upcomingAppointmentsInfo,
    };

BaseAllDoctorAppointmentsResponse _$BaseAllDoctorAppointmentsResponseFromJson(
        Map<String, dynamic> json) =>
    BaseAllDoctorAppointmentsResponse(
      json['patient'] as String?,
      json['_id'] as String?,
      json['type'] as String?,
      json['status'] as String?,
      json['paid'] as bool?,
      json['date'] as String?,
      json['comment'] as String?,
      json['payTime'] as String?,
      json['price'] as int?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$BaseAllDoctorAppointmentsResponseToJson(
        BaseAllDoctorAppointmentsResponse instance) =>
    <String, dynamic>{
      '_id': instance.appointmentId,
      'type': instance.type,
      'status': instance.status,
      'paid': instance.paid,
      'date': instance.date,
      'comment': instance.comment,
      'payTime': instance.payTime,
      'price': instance.price,
      '__v': instance.v,
      'patient': instance.patientId,
    };

AllDoctorAppointmentsResponse _$AllDoctorAppointmentsResponseFromJson(
        Map<String, dynamic> json) =>
    AllDoctorAppointmentsResponse(
      json['results'] as int?,
      (json['allAppointments'] as List<dynamic>?)
          ?.map((e) => BaseAllDoctorAppointmentsResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$AllDoctorAppointmentsResponseToJson(
        AllDoctorAppointmentsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'results': instance.results,
      'allAppointments': instance.allAppointmentsInfo,
    };

AvailableAppointmentsResponse _$AvailableAppointmentsResponseFromJson(
        Map<String, dynamic> json) =>
    AvailableAppointmentsResponse(
      json['results'] as int?,
      (json['availableAppointments'] as List<dynamic>?)
          ?.map((e) =>
              BaseAppointmentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['availableAppointmentsByDay'] as List<dynamic>?)
          ?.map((e) =>
              BaseAppointmentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$AvailableAppointmentsResponseToJson(
        AvailableAppointmentsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'results': instance.results,
      'availableAppointments': instance.availableAppointmentsInfo,
      'availableAppointmentsByDay': instance.availableAppointmentsByDayInfo,
    };

BaseBookedAppointmentResponse _$BaseBookedAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    BaseBookedAppointmentResponse(
      json['doctor'] == null
          ? null
          : UserResponse.fromJson(json['doctor'] as Map<String, dynamic>),
      json['patient'] == null
          ? null
          : UserResponse.fromJson(json['patient'] as Map<String, dynamic>),
      json['_id'] as String?,
      json['type'] as String?,
      json['status'] as String?,
      json['paid'] as bool?,
      json['date'] as String?,
      json['comment'] as String?,
      json['payTime'] as String?,
      json['price'] as int?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$BaseBookedAppointmentResponseToJson(
        BaseBookedAppointmentResponse instance) =>
    <String, dynamic>{
      '_id': instance.appointmentId,
      'type': instance.type,
      'status': instance.status,
      'paid': instance.paid,
      'date': instance.date,
      'comment': instance.comment,
      'payTime': instance.payTime,
      'price': instance.price,
      '__v': instance.v,
      'doctor': instance.doctorInfo,
      'patient': instance.patientInfo,
    };

BookedAppointmentResponse _$BookedAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    BookedAppointmentResponse(
      json['appointment'] == null
          ? null
          : UserMyAppointmentsResponse.fromJson(
              json['appointment'] as Map<String, dynamic>),
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$BookedAppointmentResponseToJson(
        BookedAppointmentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'appointment': instance.bookedAppointmentInfo,
    };
