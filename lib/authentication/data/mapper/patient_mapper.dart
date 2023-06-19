import 'package:health_care/authentication/data/response/patient_response/patient_response.dart';
import 'package:health_care/authentication/domain/model/patient_model.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';

extension PatientUserResponseMapper on PatientUserResponse? {
  PatientUser toDomain() {
    return PatientUser(
      this?.appointments?.orEmptyList() ?? Constants.emptyList,
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
      this?.token?.orEmpty() ?? Constants.empty,
      this?.data?.toDomain(),
    );
  }
}
