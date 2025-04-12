import 'dart:convert';
class DoctorAppointmentModel {
  String? appointmentId;
  String? doctorId;
  String? time;
  String? price;
  String? date;

  DoctorAppointmentModel({
    this.appointmentId,
    this.doctorId,
    this.time,
    this.price,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'appointmentId': appointmentId,
      'doctorId': doctorId,
      'time': time,
      'price': price,
      'date': date,
    };
  }

  factory DoctorAppointmentModel.fromMap(Map<String, dynamic> map) {
    return DoctorAppointmentModel(
      appointmentId: map['appointmentId'],
      doctorId: map['doctorId'],
      time: map['time'],
      price: map['price'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorAppointmentModel.fromJson(String source) =>
      DoctorAppointmentModel.fromMap(json.decode(source));
}