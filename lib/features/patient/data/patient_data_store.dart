import 'package:flutter/foundation.dart';
import 'package:final_project/features/patient/data/models/patient_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PatientDataStore {
  static const String boxName = 'requestsBox';

  Box<PatientRequest> get _box => Hive.box<PatientRequest>(boxName);

  List<PatientRequest> getAllRequests() => _box.values.toList();

  void addRequest(PatientRequest request) {
    _box.put(request.id, request);
  }

  void removeRequest(String id) {
    _box.delete(id);
  }

  ValueListenable<Box<PatientRequest>> get listenable => _box.listenable();
}
