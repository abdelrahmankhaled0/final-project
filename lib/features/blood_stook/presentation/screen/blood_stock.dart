import 'package:flutter/material.dart';
import 'package:final_project/core/utils/colors.dart';

class BloodStockScreen extends StatelessWidget {
  const BloodStockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات مخزون الدم
    final List<Map<String, dynamic>> bloodStock = [
      {'type': 'A+', 'units': 25, 'status': 'Sufficient'},
      {'type': 'A-', 'units': 10, 'status': 'Low'},
      {'type': 'B+', 'units': 30, 'status': 'Sufficient'},
      {'type': 'B-', 'units': 8, 'status': 'Low'},
      {'type': 'AB+', 'units': 18, 'status': 'Sufficient'},
      {'type': 'AB-', 'units': 5, 'status': 'Critical'},
      {'type': 'O+', 'units': 40, 'status': 'Sufficient'},
      {'type': 'O-', 'units': 12, 'status': 'Low'},
    ];

    // ألوان الحالة
    Color getStatusColor(String status) {
      switch (status) {
        case 'Sufficient':
          return Colors.green;
        case 'Low':
          return Colors.orange;
        case 'Critical':
          return Colors.red;
        default:
          return AppColors.grayColor;
      }
    }

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: bloodStock.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.95,
          ),
          itemBuilder: (context, index) {
            final stock = bloodStock[index];
            final color = getStatusColor(stock['status']);

            return Card(
              color: AppColors.backGroundColor,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: AppColors.borderColor, width: 1.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Container(
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // نوع الدم
                      CircleAvatar(
                        backgroundColor: AppColors.primaryColor.withOpacity(
                          0.1,
                        ),
                        radius: 30,
                        child: Text(
                          stock['type'],
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // عدد الوحدات
                      Text(
                        "Units: ${stock['units']}",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.darkColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // الحالة
                      Text(
                        stock['status'],
                        style: TextStyle(
                          color: color,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // زر التفاصيل
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: AppColors.backGroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  side: BorderSide(
                                    color: AppColors.borderColor,
                                    width: 1,
                                  ),
                                ),
                                title: Text(
                                  "${stock['type']} Details",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: Text(
                                  "Status: ${stock['status']}\n"
                                  "Available Units: ${stock['units']}\n"
                                  "Last Updated: Today",
                                  style: TextStyle(color: AppColors.darkColor),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      'Close',
                                      style: TextStyle(
                                        color: AppColors.borderColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Details',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
