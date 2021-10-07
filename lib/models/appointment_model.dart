import 'package:flutter/material.dart';

class Appointment {
  final DateTime date;
  final HourFormat hour;
  final String state;

  Appointment({
    required this.date,
    required this.hour,
    required this.state,
  });

  factory Appointment.fromJson(Map<dynamic, dynamic> json) {
    final DateTime date = json['date'];
    final HourFormat hour = json['hour'];
    final String state = json['state'];

    return Appointment(
      date: date,
      hour: hour,
      state: state,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'hour': hour,
      'state': state,
    };
  }

  @override
  String toString() => ' date: $date , hour: $hour, state:$state, ';
}
