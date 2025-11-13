import 'package:hive/hive.dart';

part 'patient_model.g.dart';

@HiveType(typeId: 0)
class PatientRequest extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String patientName;

  @HiveField(2)
  String requestType;

  @HiveField(3)
  String priority;

  @HiveField(4)
  String details;

  PatientRequest({
    required this.id,
    required this.patientName,
    required this.requestType,
    required this.priority,
    required this.details,
  });
}

// Patient عادي (مش محفوظ في Hive) - اختياري
class Patient {
  final String name;
  final String status;
  final String room;
  final String doctor;
  final String statusColor;

  Patient({
    required this.name,
    required this.status,
    required this.room,
    required this.doctor,
    required this.statusColor,
  });
}
