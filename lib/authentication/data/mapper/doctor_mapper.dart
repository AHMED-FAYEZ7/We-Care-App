import 'package:health_care/authentication/data/response/doctor_repo/doctor_response.dart';
import 'package:health_care/authentication/domain/model/doctor_model.dart';
import 'package:health_care/core/utils/extension.dart';

extension DoctorUserResponseMapper on DoctorUserResponse? {
  DoctorUser toDomain() {
    return DoctorUser(
      this?.specialization?.orEmpty() ?? EMPTY,
      this?.fees?.orZero() ?? ZERO,
      this?.timePerPatient?.orZero() ?? ZERO,
      this?.timeTable?.orEmptyList() ?? EMPTY_LIST,
      this?.patients?.orEmptyList() ?? EMPTY_LIST,
      this?.appointments?.orEmptyList() ?? EMPTY_LIST,
      this?.averageRating?.orZeroDouble() ?? ZERO_DOUBLE,
      this?.status?.orEmpty() ?? EMPTY,
      this?.id?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.email?.orEmpty() ?? EMPTY,
      this?.confirmed?.orFalse() ?? FALSE,
      this?.active?.orFalse() ?? FALSE,
      this?.type?.orEmpty() ?? EMPTY,
      this?.userName?.orEmpty() ?? EMPTY,
      this?.v?.orZero() ?? ZERO,
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
      this?.token?.orEmpty() ?? EMPTY,
    );
  }
}
