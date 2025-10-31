class BloodStock {
  final String type;
  final int units;
  final String status;

  BloodStock({required this.type, required this.units, required this.status});
}

class BloodRequest {
  final String id;
  final String patient;
  final String bloodType;
  final int units;
  final String priority;

  BloodRequest({
    required this.id,
    required this.patient,
    required this.bloodType,
    required this.units,
    required this.priority,
  });
}
