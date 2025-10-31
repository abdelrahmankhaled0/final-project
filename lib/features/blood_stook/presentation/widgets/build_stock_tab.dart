import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/blood_stook/data/models/blood_stock_model.dart';
import 'package:flutter/material.dart';

Widget buildStockTab() {
  final List<BloodStock> bloodStock = [
    BloodStock(type: 'A+', units: 25, status: 'Sufficient'),
    BloodStock(type: 'A-', units: 10, status: 'Low'),
    BloodStock(type: 'B+', units: 30, status: 'Sufficient'),
    BloodStock(type: 'B-', units: 8, status: 'Low'),
    BloodStock(type: 'AB+', units: 18, status: 'Sufficient'),
    BloodStock(type: 'AB-', units: 5, status: 'Critical'),
    BloodStock(type: 'O+', units: 40, status: 'Sufficient'),
    BloodStock(type: 'O-', units: 12, status: 'Low'),
  ];
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

  return Padding(
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
        final color = getStatusColor(stock.status);

        return Card(
          color: AppColors.backGroundColor,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.borderColor, width: 1.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                  radius: 30,
                  child: Text(
                    stock.type,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Units: ${stock.units}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.darkColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  stock.status,
                  style: TextStyle(
                    color: color,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ElevatedButton(
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
                            "${stock.type} Details",
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text(
                            "Status: ${stock.status}\n"
                            "Available Units: ${stock.units}\n"
                            "Last Updated: Today",
                            style: const TextStyle(color: AppColors.darkColor),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Close',
                                style: TextStyle(color: AppColors.borderColor),
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
        );
      },
    ),
  );
}
