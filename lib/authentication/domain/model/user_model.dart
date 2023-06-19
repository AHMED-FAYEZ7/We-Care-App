//////////// user login ////////////
class User {
  String specialization;
  String fees;
  String timePerPatient;
  List<String> scheduleTiming;
  List<String> appointments;
  List<String> patients;
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
