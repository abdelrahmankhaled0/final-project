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

class PatientRequest {
  final String id;
  final String patientName;
  final String requestType;
  final String priority;
  final String details;

  PatientRequest({
    required this.id,
    required this.patientName,
    required this.requestType,
    required this.priority,
    required this.details,
  });
}
