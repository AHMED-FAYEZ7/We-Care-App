import 'package:health_care/authentication/data/mapper/user_mapper.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';
import 'package:health_care/patient/data/response/patient_response.dart';
import 'package:health_care/patient/domain/model/patient_entities.dart';

extension AllDoctorsResponseMapper on AllDoctorsResponse? {
  AllDoctors toDomain() {
    int result = this?.results?.orZero() ?? Constants.zero;

    List<User> allDoctorsResponse =
        (this?.allDoctors?.map((doctorResponse) => doctorResponse.toDomain()) ??
                const Iterable.empty())
            .cast<User>()
            .toList();

    return AllDoctors(
      result,
      allDoctorsResponse,
    );
  }
}

extension TopDoctorsResponseMapper on TopDoctorsResponse? {
  TopDoctors toDomain() {
    int result = this?.results?.orZero() ?? Constants.zero;

    List<User> topDoctorsResponse =
        (this?.allDoctors?.map((doctorResponse) => doctorResponse.toDomain()) ??
                const Iterable.empty())
            .cast<User>()
            .toList();

    return TopDoctors(
      result,
      topDoctorsResponse,
    );
  }
}

extension DoctorsSpecializationResponseMapper
    on DoctorsSpecializationResponse? {
  DoctorsSpecialization toDomain() {
    int doctorsNum = this?.doctorsNum?.orZero() ?? Constants.zero;
    int result = this?.results?.orZero() ?? Constants.zero;

    List<User> doctorsData = (this
                ?.doctorsData
                ?.map((doctorResponse) => doctorResponse.toDomain()) ??
            const Iterable.empty())
        .cast<User>()
        .toList();

    return DoctorsSpecialization(
      doctorsNum,
      result,
      doctorsData,
    );
  }
}
