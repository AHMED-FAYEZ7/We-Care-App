import 'package:health_care/authentication/data/mapper/user_mapper.dart';
import 'package:health_care/authentication/data/response/doctor_response/doctor_response.dart';
import 'package:health_care/authentication/domain/model/doctor_model.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';

extension DoctorAuthResponseMapper on DoctorAuthResponse? {
  DoctorAuth toDomain() {
    return DoctorAuth(
      this?.token?.orEmpty() ?? Constants.empty,
      this?.user?.toDomain(),
    );
  }
}
