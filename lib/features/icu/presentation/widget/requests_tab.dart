import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/icu/data/model/icu_model.dart';
import 'package:flutter/material.dart';

class RequestsTabICU extends StatelessWidget {
  final List<ICURequest> requests;
  const RequestsTabICU({super.key, required this.requests});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final req = requests[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: AppColors.borderColor, width: 1.2),
            ),
            elevation: 3,
            child: ListTile(
              leading: const Icon(
                Icons.notification_important,
                color: AppColors.primaryColor,
              ),
              title: Text(
                req.patient,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkColor,
                ),
              ),
              subtitle: Text(
                "Priority: ${req.priority}",
                style: const TextStyle(color: AppColors.grayColor),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primaryColor,
                size: 18,
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
                        Text(
                          "Request Details",
                          style: const TextStyle(
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
                          "Priority: ${req.priority}",
                          style: const TextStyle(color: AppColors.grayColor),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Requested ICU Type:",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "- Critical Care Unit\n- Ventilator required\n- Cardiac monitoring",
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
                                  side: const BorderSide(
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                // هنا ممكن تضيف كود رفض الطلب
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
                                // هنا ممكن تضيف كود قبول الطلب
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
}
