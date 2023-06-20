import 'package:health_care/authentication/domain/model/doctor_model.dart';

//////////// user login ////////////
class User {
  String specialization;
  int fees;
  List<ScheduleTiming> scheduleTiming;
  double timePerPatient;
  List<String> patients;
  List<String> appointments;
  double numberOfRating;
  double averageRating;
  String status;
  String id;
  String name;
  String email;
  String profilePicture;
  bool confirmed;
  bool active;
  String type;
  List<String> address;
  String userName;
  int v;
  String emailConfirm;

  User(
    this.specialization,
    this.fees,
    this.timePerPatient,
    this.scheduleTiming,
    this.appointments,
    this.patients,
    this.numberOfRating,
    this.averageRating,
    this.status,
    this.id,
    this.name,
    this.email,
    this.profilePicture,
    this.confirmed,
    this.active,
    this.type,
    this.address,
    this.userName,
    this.v,
    this.emailConfirm,
  );
}

class UserData {
  String token;
  User? user;

  UserData(this.token, this.user);
}

/////////// user forget password ///////////////////
class UserForgetPassword {
  String status;
  String message;

  UserForgetPassword(
    this.status,
    this.message,
  );
}

/////////// user update password /////////////////
class UserUpdatePassword {
  String status;
  String message;
  String token;

  UserUpdatePassword(this.status, this.message, this.token);
}

/////////// user email confirmation ///////////////////
class UserEmailConfirmation {
  String status;
  String message;

  UserEmailConfirmation(
    this.status,
    this.message,
  );
}

/////////// user update info ///////////////////
class UserUpdateInfo {
  User? user;

  UserUpdateInfo(
    this.user,
  );
}
