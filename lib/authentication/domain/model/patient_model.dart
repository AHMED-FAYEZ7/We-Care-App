class PatientUser {
  List<String> appointments;
  String id;
  String name;
  String email;
  bool confirmed;
  bool active;
  String type;
  String userName;
  int v;

  PatientUser(
    this.appointments,
    this.id,
    this.name,
    this.email,
    this.confirmed,
    this.active,
    this.type,
    this.userName,
    // string <=====
    this.v,
  );
}

class PatientData {
  PatientUser? user;

  PatientData(this.user);
}

class PatientAuth {
  String token;
  PatientData? data;

  PatientAuth(this.token, this.data);
}
