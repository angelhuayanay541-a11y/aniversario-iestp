import 'package:flutter/material.dart';

class Activity {
  final String id;
  final String title;
  final String description;
  final String time;
  final String date;
  final String location;
  final IconData icon;
  final String category;
  final bool isCompleted;

  Activity({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.date,
    required this.location,
    required this.icon,
    required this.category,
    this.isCompleted = false,
  });
}
