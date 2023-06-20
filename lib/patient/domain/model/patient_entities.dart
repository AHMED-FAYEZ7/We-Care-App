import 'package:health_care/authentication/domain/model/user_model.dart';

class AllDoctors {
  int results;
  List<User>? allDoctorsData;

  AllDoctors(
    this.results,
    this.allDoctorsData,
  );
}
