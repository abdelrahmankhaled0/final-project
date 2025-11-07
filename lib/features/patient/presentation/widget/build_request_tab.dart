import 'package:flutter/material.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/patient/data/models/patient_model.dart';

Widget buildRequestsTab({
  required List<PatientRequest> requests,
  required Function(String) onRemoveRequest,
}) {
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

  if (requests.isEmpty) {
    return const Center(
      child: Text(
        "No requests yet.",
        style: TextStyle(color: AppColors.grayColor),
      ),
    );
  }

  return ListView.builder(
    padding: const EdgeInsets.all(12),
    itemCount: requests.length,
    itemBuilder: (context, index) {
      final req = requests[index];
      final color = getPriorityColor(req.priority);

      return Dismissible(
        key: ValueKey(req.id),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.redAccent,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: (_) => onRemoveRequest(req.id),
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.borderColor, width: 1.2),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.notifications_active_outlined,
              color: AppColors.primaryColor,
            ),
            title: Text(
              req.patientName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("${req.requestType} (${req.priority})"),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              onPressed: () => onRemoveRequest(req.id),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: AppColors.backGroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: AppColors.borderColor),
                  ),
                  title: const Text(
                    "Request Details",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Patient: ${req.patientName}"),
                      Text("Type: ${req.requestType}"),
                      Text(
                        "Priority: ${req.priority}",
                        style: TextStyle(color: color),
                      ),
                      const SizedBox(height: 8),
                      Text("Details:\n${req.details}"),
                    ],
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
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
        ),
      );
    },
  );
}
