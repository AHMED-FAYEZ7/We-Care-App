class Appointment {
  bool paid;
  String appointmentId;
  String type;
  String status;
  String doctorId;
  String patientId;
  String date;
  int v;
  int price;

  Appointment(
    this.paid,
    this.appointmentId,
    this.type,
    this.status,
    this.doctorId,
    this.patientId,
    this.date,
    this.v,
    this.price,
  );
}

class AppointmentsInfo {
  List<Appointment>? allAppointmentsData;
  List<Appointment>? availableAppointmentsData;
  List<Appointment>? availableAppointmentsByDayData;
  List<Appointment>? upcomingAppointmentsData;
  Appointment? bookedAppointmentData;

  AppointmentsInfo(
    this.allAppointmentsData,
    this.availableAppointmentsData,
    this.availableAppointmentsByDayData,
    this.bookedAppointmentData,
    this.upcomingAppointmentsData,
  );
}
