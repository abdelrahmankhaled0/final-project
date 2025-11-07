import 'package:final_project/core/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/patient/data/models/patient_model.dart';

class AddRequestDialog extends StatefulWidget {
  final Patient patient;
  final Function(PatientRequest) onSubmit;

  const AddRequestDialog({
    super.key,
    required this.patient,
    required this.onSubmit,
  });

  @override
  State<AddRequestDialog> createState() => _AddRequestDialogState();
}

class _AddRequestDialogState extends State<AddRequestDialog> {
  final TextEditingController typeController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  String selectedPriority = 'Normal';

  @override
  void dispose() {
    typeController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backGroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.borderColor, width: 1),
      ),
      title: Text(
        "Add Request for ${widget.patient.name}",
        style: const TextStyle(color: AppColors.primaryColor),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              cursorColor: AppColors.primaryColor,
              controller: typeController,
              decoration: const InputDecoration(
                labelText: "Request Type",
                labelStyle: TextStyle(color: AppColors.primaryColor),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              cursorColor: AppColors.primaryColor,
              controller: detailsController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Details",
                labelStyle: TextStyle(color: AppColors.primaryColor),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedPriority,
              decoration: const InputDecoration(
                labelText: "Priority",
                labelStyle: TextStyle(color: AppColors.primaryColor),
                border: OutlineInputBorder(),
              ),
              items: [
                'Normal',
                'High',
                'Critical',
              ].map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
              onChanged: (val) => setState(() => selectedPriority = val!),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
          ),
          onPressed: () {
            if (typeController.text.isNotEmpty &&
                detailsController.text.isNotEmpty) {
              final newRequest = PatientRequest(
                id: "REQ-${DateTime.now().millisecondsSinceEpoch}",
                patientName: widget.patient.name,
                requestType: typeController.text,
                priority: selectedPriority,
                details: detailsController.text,
              );
              widget.onSubmit(newRequest);
              Navigator.pop(context);
            }
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
