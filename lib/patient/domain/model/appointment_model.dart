import 'package:health_care/authentication/domain/model/user_model.dart';

class Appointment {
  bool paid;
  String appointmentId;
  String type;
  String status;
  User? doctorInfo;
  String patientId;
  String date;
  int v;
  int price;

  Appointment(
    this.paid,
    this.appointmentId,
    this.type,
    this.status,
    this.doctorInfo,
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
  List<Appointment>? pastAppointment;
  List<Appointment>? upcomingAppointmentsData;
  Appointment? bookedAppointmentData;

  AppointmentsInfo(
    this.allAppointmentsData,
    this.availableAppointmentsData,
    this.availableAppointmentsByDayData,
    this.bookedAppointmentData,
    this.pastAppointment,
    this.upcomingAppointmentsData,
  );
}
