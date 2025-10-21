import 'package:final_project/core/utils/colors.dart';
import 'package:flutter/material.dart';

class BloodDonorsScreen extends StatelessWidget {
  const BloodDonorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> donors = [
      {
        'name': 'Ahmed Hassan',
        'bloodType': 'A+',
        'status': 'Available',
        'phone': '01012345678',
      },
      {
        'name': 'Mona Ali',
        'bloodType': 'O-',
        'status': 'Unavailable',
        'phone': '01098765432',
      },
      {
        'name': 'Omar Mahmoud',
        'bloodType': 'B+',
        'status': 'Available',
        'phone': '01122334455',
      },
      {
        'name': 'Sara Tarek',
        'bloodType': 'AB+',
        'status': 'Unavailable',
        'phone': '01299887766',
      },
    ];

    Color getStatusColor(String status) {
      return status == 'Available'
          ? Colors.green
          : AppColors.grayColor.withOpacity(0.7);
    }

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: donors.length,
          itemBuilder: (context, index) {
            final donor = donors[index];
            final color = getStatusColor(donor['status']);

            return Card(
              color: AppColors.backGroundColor,
              elevation: 3,
              shadowColor: AppColors.borderColor.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: AppColors.borderColor, width: 1.2),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                  radius: 28,
                  child: Text(
                    donor['bloodType'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                title: Text(
                  donor['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkColor,
                  ),
                ),
                subtitle: Text(
                  donor['status'],
                  style: TextStyle(
                    color: color,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.phone, color: AppColors.borderColor),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: AppColors.backGroundColor,
                        title: Text(
                          'Contact ${donor['name']}',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                        content: Text(
                          'Phone: ${donor['phone']}',
                          style: TextStyle(color: AppColors.darkColor),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Close',
                              style: TextStyle(color: AppColors.borderColor),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
