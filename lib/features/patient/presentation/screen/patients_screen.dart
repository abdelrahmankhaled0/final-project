import 'package:final_project/core/utils/colors.dart';
import 'package:flutter/material.dart';

class PatientScreen extends StatelessWidget {
  final List<Map<String, String>> patients = [
    {
      "name": "Mohamed Ahmed",
      "status": "Stable",
      "room": "ICU-01",
      "doctor": "Dr. Salma Hussein",
      "statusColor": "green",
    },
    {
      "name": "Ali Youssef",
      "status": "Critical",
      "room": "ICU-02",
      "doctor": "Dr. Karim Saeed",
      "statusColor": "red",
    },
    {
      "name": "Nour Adel",
      "status": "Under Observation",
      "room": "ICU-03",
      "doctor": "Dr. Ahmed Fathy",
      "statusColor": "orange",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,

      body: ListView.builder(
        itemCount: patients.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final patient = patients[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: AppColors.borderColor, width: 1),
            ),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                child: Icon(
                  Icons.person,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
              ),
              title: Text(
                patient["name"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.darkColor,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient["status"]!,
                    style: TextStyle(
                      color: patient["statusColor"] == "green"
                          ? Colors.green
                          : patient["statusColor"] == "red"
                          ? Colors.red
                          : Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    patient["room"]!,
                    style: const TextStyle(color: AppColors.grayColor),
                  ),
                  Text(
                    patient["doctor"]!,
                    style: const TextStyle(color: AppColors.grayColor),
                  ),
                ],
              ),
              trailing: const Icon(
                Icons.info_outline,
                color: AppColors.primaryColor,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
