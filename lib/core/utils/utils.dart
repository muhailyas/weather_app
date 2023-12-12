import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget getWeatherIcon(String value, double? scale) {
  if (value.toLowerCase().contains('cloud')) {
    return Image.asset(
      'assets/8.png',
      scale: scale,
    );
  } else if (value.toLowerCase().contains('rain')) {
    return Image.asset(
      'assets/2.png',
      scale: scale,
    );
  } else if (value.toLowerCase().contains('snow')) {
    return Image.asset(
      'assets/4.png',
      scale: scale,
    );
  } else if (value.toLowerCase().contains('sun') ||
      value.toLowerCase().contains('clear')) {
    return Image.asset(
      'assets/7.png',
      scale: scale,
    );
  } else {
    return Image.asset(
      'assets/1.png',
      scale: scale,
    );
  }
}

String formatLocalTime(String localTime) {
  final DateTime dateTime = DateTime.parse(localTime);
  final String dayOfWeek = DateFormat.EEEE().format(dateTime); // Full day name
  final String dayOfMonth = DateFormat.d().format(dateTime); // Day of the month
  final String time = DateFormat.jm().format(dateTime); // Time in AM/PM format
  return '$dayOfWeek $dayOfMonth . $time';
}

String currentGreeting() {
  final DateTime dateTime = DateTime.now();
  if (dateTime.hour < 12) {
    return "Good Morning";
  } else if (dateTime.hour >= 12 && dateTime.hour < 16) {
    return "Good Afternoon";
  } else {
    return "Good Evening";
  }
}
