import 'package:health_care/authentication/data/response/patient_response/patient_response.dart';
import 'package:health_care/authentication/domain/model/patient_model.dart';
import 'package:health_care/core/utils/extension.dart';

extension PatientUserResponseMapper on PatientUserResponse? {
  PatientUser toDomain() {
    return PatientUser(
      this?.appointments?.orEmptyList() ?? EMPTY_LIST,
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

extension PatientDataResponseMapper on PatientDataResponse? {
  PatientData toDomain() {
    return PatientData(
      this?.user?.toDomain(),
    );
  }
}

extension PatientAuthResponseMapper on PatientAuthResponse? {
  PatientAuth toDomain() {
    return PatientAuth(
      this?.token?.orEmpty() ?? EMPTY,
      this?.data?.toDomain(),
    );
  }
}
