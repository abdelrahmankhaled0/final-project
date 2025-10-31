import 'package:flutter/material.dart';

class ICUBed {
  final String id;
  final String status;
  final String? patient;

  ICUBed({required this.id, required this.status, this.patient});

  static Color getStatusColor(String status) {
    switch (status) {
      case 'Available':
        return Colors.green;
      case 'Occupied':
        return Colors.red;
      case 'Cleaning':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  static IconData getStatusIcon(String status) {
    switch (status) {
      case 'Available':
        return Icons.bed_outlined;
      case 'Occupied':
        return Icons.person;
      case 'Cleaning':
        return Icons.cleaning_services;
      default:
        return Icons.help_outline;
    }
  }
}

class ICURequest {
  final String id;
  final String patient;
  final String priority;

  ICURequest({required this.id, required this.patient, required this.priority});
}
