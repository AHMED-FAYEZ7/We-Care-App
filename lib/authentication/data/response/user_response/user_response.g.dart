// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['specialization'] as String?,
      json['fees'] as int?,
      (json['timePerPatient'] as num?)?.toDouble(),
      (json['ScheduleTiming'] as List<dynamic>?)
          ?.map(
              (e) => ScheduleTimingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['patients'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['appointments'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['numberOfRating'] as num?)?.toDouble(),
      (json['averageRating'] as num?)?.toDouble(),
      json['status'] as String?,
      json['_id'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['profilePicture'] as String?,
      json['confirmed'] as bool?,
      json['active'] as bool?,
      json['__t'] as String?,
      (json['address'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['username'] as String?,
      json['__v'] as int?,
      json['emailConfirm'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'specialization': instance.specialization,
      'fees': instance.fees,
      'timePerPatient': instance.timePerPatient,
      'ScheduleTiming': instance.scheduleTiming,
      'patients': instance.patients,
      'appointments': instance.appointments,
      'numberOfRating': instance.numberOfRating,
      'averageRating': instance.averageRating,
      'status': instance.status,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
      'confirmed': instance.confirmed,
      'active': instance.active,
      '__t': instance.type,
      'address': instance.address,
      'username': instance.userName,
      '__v': instance.v,
      'emailConfirm': instance.emailConfirm,
    };

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['token'] as String?,
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };

UserForgetPasswordResponse _$UserForgetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    UserForgetPasswordResponse(
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$UserForgetPasswordResponseToJson(
        UserForgetPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

UserUpdatePasswordResponse _$UserUpdatePasswordResponseFromJson(
        Map<String, dynamic> json) =>
    UserUpdatePasswordResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['token'] as String?,
    );

Map<String, dynamic> _$UserUpdatePasswordResponseToJson(
        UserUpdatePasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
    };

UserEmailConfirmationResponse _$UserEmailConfirmationResponseFromJson(
        Map<String, dynamic> json) =>
    UserEmailConfirmationResponse(
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$UserEmailConfirmationResponseToJson(
        UserEmailConfirmationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

UserUpdateInfoResponse _$UserUpdateInfoResponseFromJson(
        Map<String, dynamic> json) =>
    UserUpdateInfoResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : UserResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUpdateInfoResponseToJson(
        UserUpdateInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.user,
    };
