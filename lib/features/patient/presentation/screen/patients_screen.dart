import 'package:final_project/features/patient/data/models/patient_model.dart';
import 'package:final_project/features/patient/presentation/widget/build_patient_tab.dart';
import 'package:final_project/features/patient/presentation/widget/build_request_tab.dart';
import 'package:flutter/material.dart';
import 'package:final_project/core/utils/colors.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: AppColors.backGroundColor),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.grayColor,
              labelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(text: "Patients"),
                Tab(text: "Requests"),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [buildPatientsTab(), buildRequestsTab()],
            ),
          ),
        ],
      ),
    );
  }
}
