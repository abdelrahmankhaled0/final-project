import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/patient/data/models/patient_model.dart';
import 'package:flutter/material.dart';

Widget buildRequestsTab() {
  final List<PatientRequest> requests = [
    PatientRequest(
      id: "REQ-201",
      patientName: "Mohamed Ahmed",
      requestType: "Pain Relief",
      priority: "High",
      details: "Patient is complaining of severe headache.",
    ),
    PatientRequest(
      id: "REQ-202",
      patientName: "Ali Youssef",
      requestType: "Doctor Visit",
      priority: "Critical",
      details: "Needs immediate doctor check due to low oxygen levels.",
    ),
    PatientRequest(
      id: "REQ-203",
      patientName: "Nour Adel",
      requestType: "Food Request",
      priority: "Normal",
      details: "Patient requested lunch (soft diet).",
    ),
  ];

  Color getPriorityColor(String priority) {
    switch (priority) {
      case "High":
        return Colors.orange;
      case "Critical":
        return Colors.red;
      default:
        return AppColors.grayColor;
    }
  }

  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final req = requests[index];
        final color = getPriorityColor(req.priority);

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.borderColor, width: 1.2),
          ),
          elevation: 3,
          child: ListTile(
            leading: const Icon(
              Icons.notifications_active_outlined,
              color: AppColors.primaryColor,
            ),
            title: Text(
              req.patientName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.darkColor,
              ),
            ),
            subtitle: Text(
              "${req.requestType} (${req.priority})",
              style: const TextStyle(color: AppColors.grayColor),
            ),
            trailing: Text(
              req.priority,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: AppColors.backGroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(
                      color: AppColors.borderColor,
                      width: 1.0,
                    ),
                  ),
                  title: const Row(
                    children: [
                      Icon(Icons.info_outline, color: AppColors.primaryColor),
                      SizedBox(width: 8),
                      Text(
                        "Request Details",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Patient: ${req.patientName}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Type: ${req.requestType}",
                        style: const TextStyle(color: AppColors.grayColor),
                      ),
                      Text(
                        "Priority: ${req.priority}",
                        style: TextStyle(color: color),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Details:\n${req.details}",
                        style: const TextStyle(color: AppColors.grayColor),
                      ),
                    ],
                  ),
                  actionsPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.redAccent.withOpacity(
                                0.15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: Colors.redAccent),
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "Reject",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.primaryColor
                                  .withOpacity(0.15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "Accept",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    ),
  );
}
