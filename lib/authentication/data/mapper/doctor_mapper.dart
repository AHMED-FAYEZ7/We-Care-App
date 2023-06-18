import 'package:health_care/authentication/data/response/doctor_response/doctor_response.dart';
import 'package:health_care/authentication/domain/model/doctor_model.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';

extension DoctorUserResponseMapper on DoctorUserResponse? {
  DoctorUser toDomain() {
    return DoctorUser(
      this?.specialization?.orEmpty() ?? Constants.empty,
      this?.fees?.orZero() ?? Constants.zero,
      this?.timePerPatient?.orZero() ?? Constants.zero,
      this?.timeTable?.orEmptyList() ?? Constants.emptyList,
      this?.patients?.orEmptyList() ?? Constants.emptyList,
      this?.appointments?.orEmptyList() ?? Constants.emptyList,
      this?.averageRating?.orZeroDouble() ?? Constants.zeroDouble,
      this?.status?.orEmpty() ?? Constants.empty,
      this?.id?.orEmpty() ?? Constants.empty,
      this?.name?.orEmpty() ?? Constants.empty,
      this?.email?.orEmpty() ?? Constants.empty,
      this?.confirmed?.orFalse() ?? Constants.FALSE,
      this?.active?.orFalse() ?? Constants.FALSE,
      this?.type?.orEmpty() ?? Constants.empty,
      this?.userName?.orEmpty() ?? Constants.empty,
      this?.v?.orZero() ?? Constants.zero,
    );
  }
}

extension DoctorDataResponseMapper on DoctorDataResponse? {
  DoctorData toDomain() {
    return DoctorData(
      this?.user?.toDomain(),
    );
  }
}

extension DoctorAuthResponseMapper on DoctorAuthResponse? {
  DoctorAuth toDomain() {
    return DoctorAuth(
      this?.data?.toDomain(),
      this?.token?.orEmpty() ?? Constants.empty,
    );
  }
}
