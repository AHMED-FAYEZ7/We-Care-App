import 'package:health_care/authentication/domain/model/user_model.dart';

class AllDoctors {
  int results;
  List<User>? allDoctorsData;
  List<User>? doctorSearchData;

  AllDoctors(
    this.results,
    this.allDoctorsData,
    this.doctorSearchData,
  );
}

class TopDoctors extends AllDoctors {
  TopDoctors(
    super.results,
    super.allDoctorsData,
    super.doctorSearchData,
  );
}

class DoctorsSpecialization {
  int doctorsNum;
  int results;
  List<User>? doctorsData;

  DoctorsSpecialization(
    this.doctorsNum,
    this.results,
    this.doctorsData,
  );
}
