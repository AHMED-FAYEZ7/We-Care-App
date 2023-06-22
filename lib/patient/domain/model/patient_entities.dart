import 'package:health_care/authentication/domain/model/user_model.dart';

class AllDoctors {
  int results;
  List<User>? allDoctorsData;

  AllDoctors(
    this.results,
    this.allDoctorsData,
  );
}

class TopDoctors extends AllDoctors {
  TopDoctors(super.results, super.allDoctorsData);
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
