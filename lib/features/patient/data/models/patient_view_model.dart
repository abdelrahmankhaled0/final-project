import 'package:final_project/features/patient/data/models/patient_model.dart';
import 'package:final_project/features/patient/data/patient_data_store.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PatientViewModel extends ChangeNotifier {
  final PatientDataStore _store = PatientDataStore();

  Box<PatientRequest> get requestsBox =>
      _store.listenable as Box<PatientRequest>;

  List<Patient> get patients => [
    Patient(
      name: "Mohamed Ahmed",
      status: "Stable",
      room: "ICU-01",
      doctor: "Dr. Salma",
      statusColor: "green",
    ),
    Patient(
      name: "Ali Youssef",
      status: "Critical",
      room: "ICU-02",
      doctor: "Dr. Karim",
      statusColor: "red",
    ),
    Patient(
      name: "Nour Adel",
      status: "Under Observation",
      room: "ICU-03",
      doctor: "Dr. Ahmed",
      statusColor: "orange",
    ),
  ];

  void addRequest(PatientRequest req) {
    _store.addRequest(req);
    notifyListeners();
  }

  void removeRequest(String id) {
    _store.removeRequest(id);
    notifyListeners();
  }
}
