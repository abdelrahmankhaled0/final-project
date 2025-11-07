import 'package:final_project/features/patient/presentation/widget/build_show_request_dialog_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/patient/data/models/patient_model.dart';

Widget buildPatientsTab({required Function(PatientRequest) onAddRequest}) {
  final List<Patient> patients = [
    Patient(
      name: "Mohamed Ahmed",
      status: "Stable",
      room: "ICU-01",
      doctor: "Dr. Salma Hussein",
      statusColor: "green",
    ),
    Patient(
      name: "Ali Youssef",
      status: "Critical",
      room: "ICU-02",
      doctor: "Dr. Karim Saeed",
      statusColor: "red",
    ),
    Patient(
      name: "Nour Adel",
      status: "Under Observation",
      room: "ICU-03",
      doctor: "Dr. Ahmed Fathy",
      statusColor: "orange",
    ),
  ];

  Color getStatusColor(String statusColor) {
    switch (statusColor) {
      case "red":
        return Colors.red;
      case "green":
        return Colors.green;
      case "orange":
        return Colors.orange;
      default:
        return AppColors.grayColor;
    }
  }

  return ListView.builder(
    itemCount: patients.length,
    padding: const EdgeInsets.all(12),
    itemBuilder: (context, index) {
      final patient = patients[index];
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.borderColor, width: 1),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: const Icon(Icons.person, color: AppColors.primaryColor),
          title: Text(
            patient.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "${patient.status} - ${patient.room}",
            style: TextStyle(color: getStatusColor(patient.statusColor)),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AddRequestDialog(
                  patient: patient,
                  onSubmit: (req) {
                    onAddRequest(req);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Request added for ${req.patientName} ✅"),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
