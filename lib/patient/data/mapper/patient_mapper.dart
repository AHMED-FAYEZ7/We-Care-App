import 'package:health_care/authentication/data/mapper/user_mapper.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';
import 'package:health_care/patient/data/response/patient_response.dart';
import 'package:health_care/patient/domain/model/patient_entities.dart';

extension DoctorInfoResponseMapper on DoctorInfResponse? {
  DoctorInfo toDomain() {
    int result = this?.resultsResponse?.orZero() ?? Constants.zero;
    int doctorsNum = this?.doctorsNumResponse?.orZero() ?? Constants.zero;

    List<User> allDoctorsDataMapped = (this?.allDoctorsResponse?.map(
                  (doctorResponse) => doctorResponse.toDomain(),
                ) ??
            const Iterable.empty())
        .cast<User>()
        .toList();

    List<User> doctorSearchDataMapped = (this
                ?.doctorsSearchDataResponse
                ?.map((doctorResponse) => doctorResponse.toDomain()) ??
            const Iterable.empty())
        .cast<User>()
        .toList();

    List<User> topDoctorDataMapped = (this?.topDoctorsDataResponse?.map(
                  (doctorResponse) => doctorResponse.toDomain(),
                ) ??
            const Iterable.empty())
        .cast<User>()
        .toList();
    List<User> doctorsSpecializationDataMapped =
        (this?.specializedDoctorsDataResponse?.map(
                      (doctorResponse) => doctorResponse.toDomain(),
                    ) ??
                const Iterable.empty())
            .cast<User>()
            .toList();

    return DoctorInfo(
      result,
      doctorsNum,
      allDoctorsDataMapped,
      doctorSearchDataMapped,
      topDoctorDataMapped,
      doctorsSpecializationDataMapped,
    );
  }
}

// extension TopDoctorsResponseMapper on TopDoctorsResponse? {
//   TopDoctors toDomain() {
//     int result = this?.results?.orZero() ?? Constants.zero;

//     List<User> topDoctorsResponse =
//         (this?.allDoctors?.map((doctorResponse) => doctorResponse.toDomain()) ??
//                 const Iterable.empty())
//             .cast<User>()
//             .toList();
//     List<User> doctorSearchDataResponse = (this
//                 ?.doctorsSearchData
//                 ?.map((doctorResponse) => doctorResponse.toDomain()) ??
//             const Iterable.empty())
//         .cast<User>()
//         .toList();

//     return TopDoctors(
//       result,
//       topDoctorsResponse,
//       doctorSearchDataResponse,
//     );
//   }
// }

// extension DoctorsSpecializationResponseMapper
//     on DoctorsSpecializationResponse? {
//   DoctorsSpecialization toDomain() {
//     int doctorsNum = this?.doctorsNum?.orZero() ?? Constants.zero;
//     int result = this?.results?.orZero() ?? Constants.zero;

//     List<User> doctorsData = (this
//                 ?.doctorsData
//                 ?.map((doctorResponse) => doctorResponse.toDomain()) ??
//             const Iterable.empty())
//         .cast<User>()
//         .toList();

//     return DoctorsSpecialization(
//       doctorsNum,
//       result,
//       doctorsData,
//     );
//   }
// }
