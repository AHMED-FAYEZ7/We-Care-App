import 'package:health_care/authentication/domain/model/user_model.dart';

class DoctorAuth {
  String token;
  User? user;
  DoctorAuth(
    this.token,
    this.user,
  );
}

class ScheduleTiming {
  String start;
  String end;
  String id;

  ScheduleTiming(
    this.start,
    this.end,
    this.id,
  );
}
