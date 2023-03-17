//////////// user login ////////////
class User {
  List<String> appointments;
  String id;
  String name;
  String email;
  bool confirmed;
  String type;
  String userName;
  int v;

  User(
    this.appointments,
    this.id,
    this.name,
    this.email,
    this.confirmed,
    this.type,
    this.userName,
    this.v,
  );
}

class Data {
  User? user;

  Data(this.user);
}

class UserData {
  String token;
  Data? data;

  UserData(this.token, this.data);
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
