class DoctorUser {
  String specialization;
  int fees;
  int timePerPatient;
  List<String> timeTable;
  List<String> patients;
  List<String> appointments;
  double averageRating;
  String status;
  String id;
  String name;
  String email;
  bool confirmed;
  bool active;
  String type;
  String username;
  int v;

  DoctorUser(
    this.specialization,
    this.fees,
    this.timePerPatient,
    this.timeTable,
    this.patients,
    this.appointments,
    this.averageRating,
    this.status,
    this.id,
    this.name,
    this.email,
    this.confirmed,
    this.active,
    this.type,
    this.username,
    this.v,
  );
}

class DoctorData {
  DoctorUser? user;
  DoctorData(
    this.user,
  );
}

class DoctorAuth {
  DoctorData? data;
  String token;
  DoctorAuth(
    this.data,
    this.token,
  );
}
