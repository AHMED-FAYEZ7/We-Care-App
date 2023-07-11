// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:health_care/authentication/domain/model/user_model.dart';

class BaseAppointment {
  bool paid;
  String appointmentId;
  String type;
  String status;
  String date;
  String comment;
  String payTime;
  int price;
  int v;

  BaseAppointment(
    this.appointmentId,
    this.type,
    this.status,
    this.paid,
    this.date,
    this.comment,
    this.payTime,
    this.price,
    this.v,
  );
}

class UserMyAppointments extends BaseAppointment {
  User? doctorInfo;
  User? patientInfo;

  UserMyAppointments(
    this.doctorInfo,
    this.patientInfo,
    super.appointmentId,
    super.type,
    super.status,
    super.paid,
    super.date,
    super.comment,
    super.payTime,
    super.price,
    super.v,
  );
}

class MyAppointments {
  int results;
  List<UserMyAppointments>? pastAppointmentInfo;
  List<UserMyAppointments>? upcomingAppointmentsInfo;

  MyAppointments(
    this.results,
    this.pastAppointmentInfo,
    this.upcomingAppointmentsInfo,
  );
}

class BaseAllDoctorAppointments extends BaseAppointment {
  String patientId;

  BaseAllDoctorAppointments(
    this.patientId,
    super.appointmentId,
    super.type,
    super.status,
    super.paid,
    super.date,
    super.comment,
    super.payTime,
    super.price,
    super.v,
  );
}

class AllDoctorAppointments {
  int results;
  List<BaseAllDoctorAppointments>? allAppointmentsInfo;

  AllDoctorAppointments(
    this.results,
    this.allAppointmentsInfo,
  );
}

class AvailableAppointments {
  int results;
  List<BaseAppointment>? allAvailableAppointmentsInfo;
  List<BaseAppointment>? availableAppointmentsByDayInfo;

  AvailableAppointments(
    this.results,
    this.allAvailableAppointmentsInfo,
    this.availableAppointmentsByDayInfo,
  );
}

class BookedAppointment {
  UserMyAppointments? bookedAppointmentInfo;

  BookedAppointment(
    this.bookedAppointmentInfo,
  );
}

// class AppointmentsInfo {
//   List<Appointment>? allAppointmentsData;
//   List<Appointment>? availableAppointmentsData;
//   List<Appointment>? availableAppointmentsByDayData;
//   List<Appointment>? pastAppointment;
//   List<Appointment>? upcomingAppointmentsData;
//   Appointment? bookedAppointmentData;

//   AppointmentsInfo(
//     this.allAppointmentsData,
//     this.availableAppointmentsData,
//     this.availableAppointmentsByDayData,
//     this.bookedAppointmentData,
//     this.pastAppointment,
//     this.upcomingAppointmentsData,
//   );
// }
