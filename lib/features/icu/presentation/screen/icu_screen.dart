import 'package:final_project/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ICUBedsScreen extends StatelessWidget {
  const ICUBedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات الأسرة
    final List<Map<String, dynamic>> beds = [
      {'id': 'ICU-01', 'status': 'Available', 'patient': null},
      {'id': 'ICU-02', 'status': 'Occupied', 'patient': 'Ahmed Mohamed'},
      {'id': 'ICU-03', 'status': 'Cleaning', 'patient': null},
      {'id': 'ICU-04', 'status': 'Available', 'patient': null},
      {'id': 'ICU-05', 'status': 'Occupied', 'patient': 'Mona Ali'},
    ];

    // ألوان الحالات
    Color getStatusColor(String status) {
      switch (status) {
        case 'Available':
          return Colors.green;
        case 'Occupied':
          return Colors.red;
        case 'Cleaning':
          return Colors.orange;
        default:
          return AppColors.grayColor;
      }
    }

    IconData getStatusIcon(String status) {
      switch (status) {
        case 'Available':
          return Icons.bed_outlined;
        case 'Occupied':
          return Icons.person;
        case 'Cleaning':
          return Icons.cleaning_services;
        default:
          return Icons.help_outline;
      }
    }

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: beds.length,
          itemBuilder: (context, index) {
            final bed = beds[index];
            final color = getStatusColor(bed['status']);
            final icon = getStatusIcon(bed['status']);

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: AppColors.backGroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: AppColors.borderColor,
                  width: 1.2,
                ),
              ),
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // أيقونة السرير
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        color: AppColors.primaryColor,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // تفاصيل السرير
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bed['id'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Status: ${bed['status']}",
                            style: TextStyle(
                              color: color,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            bed['patient'] != null
                                ? "Patient: ${bed['patient']}"
                                : "No patient assigned",
                            style: const TextStyle(
                              color: AppColors.grayColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // زر عرض التفاصيل
                    IconButton(
                      icon: const Icon(Icons.info_outline),
                      color: AppColors.primaryColor,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: AppColors.backGroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: const BorderSide(
                                color: AppColors.borderColor,
                                width: 1,
                              ),
                            ),
                            title: Text(
                              bed['id'],
                              style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Status: ${bed['status']}",
                                  style: TextStyle(
                                    color: getStatusColor(bed['status']),
                                  ),
                                ),
                                if (bed['patient'] != null)
                                  Text(
                                    "Patient: ${bed['patient']}",
                                    style: const TextStyle(
                                      color: AppColors.darkColor,
                                    ),
                                  ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Details:\n- Ventilator available\n- Nurse assigned\n- Monitoring active",
                                  style: TextStyle(color: AppColors.grayColor),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'Close',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
