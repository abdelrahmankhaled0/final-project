import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/icu/data/model/icu_model.dart';
import 'package:flutter/material.dart';

class BedsTab extends StatelessWidget {
  final List<ICUBed> beds;
  const BedsTab({super.key, required this.beds});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: beds.length,
        itemBuilder: (context, index) {
          final bed = beds[index];
          final color = ICUBed.getStatusColor(bed.status);
          final icon = ICUBed.getStatusIcon(bed.status);

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: AppColors.backGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: AppColors.borderColor, width: 1.2),
            ),
            elevation: 3,
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.primaryColor, size: 32),
              ),
              title: Text(
                bed.id,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkColor,
                ),
              ),
              subtitle: Text(
                bed.patient != null
                    ? "Patient: ${bed.patient}"
                    : "No patient assigned",
                style: const TextStyle(color: AppColors.grayColor),
              ),
              trailing: Text(
                bed.status,
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }
}
