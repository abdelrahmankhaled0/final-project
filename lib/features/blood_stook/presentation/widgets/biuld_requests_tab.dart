import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/blood_stook/data/models/blood_stock_model.dart';
import 'package:flutter/material.dart';

Widget buildRequestsTab() {
  final List<BloodRequest> requests = [
    BloodRequest(
      id: 'REQ-101',
      patient: 'Ahmed Khaled',
      bloodType: 'A+',
      units: 2,
      priority: 'High',
    ),
    BloodRequest(
      id: 'REQ-102',
      patient: 'Mona Ali',
      bloodType: 'O-',
      units: 3,
      priority: 'Critical',
    ),
    BloodRequest(
      id: 'REQ-103',
      patient: 'Sara Hussein',
      bloodType: 'B+',
      units: 1,
      priority: 'Normal',
    ),
  ];
  Color getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.orange;
      case 'Critical':
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
            leading: const Icon(Icons.bloodtype, color: AppColors.primaryColor),
            title: Text(
              req.patient,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.darkColor,
              ),
            ),
            subtitle: Text(
              "Blood Type: ${req.bloodType}  |  Units: ${req.units}",
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
                  title: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      const Text(
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
                        "Patient: ${req.patient}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Blood Type: ${req.bloodType}",
                        style: const TextStyle(color: AppColors.grayColor),
                      ),
                      Text(
                        "Units Needed: ${req.units}",
                        style: const TextStyle(color: AppColors.grayColor),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Priority: ${req.priority}",
                        style: TextStyle(color: color),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Notes:\n- Immediate supply needed\n- Check donor compatibility\n- Coordinate with blood bank",
                        style: TextStyle(color: AppColors.grayColor),
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
        );
      },
    ),
  );
}
