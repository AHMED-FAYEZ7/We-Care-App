import 'package:health_care/authentication/domain/model/user_model.dart';

class DoctorInfo {
  int results;
  int doctorsNum;
  List<User>? allDoctorsData;
  List<User>? doctorsSearchData;
  List<User>? topDoctorsData;
  List<User>? doctorsSpecializationData;

  DoctorInfo(
    this.results,
    this.doctorsNum,
    this.allDoctorsData,
    this.doctorsSearchData,
    this.topDoctorsData,
    this.doctorsSpecializationData,
  );
}
