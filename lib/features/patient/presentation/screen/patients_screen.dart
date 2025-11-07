import 'package:flutter/material.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/patient/data/models/patient_model.dart';
import 'package:final_project/features/patient/presentation/widget/build_patient_tab.dart';
import 'package:final_project/features/patient/presentation/widget/build_request_tab.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<PatientRequest> requests = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void addRequest(PatientRequest req) {
    setState(() => requests.add(req));
  }

  void removeRequest(String id) {
    setState(() => requests.removeWhere((r) => r.id == id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.grayColor,
              tabs: const [
                Tab(text: "Patients"),
                Tab(text: "Requests"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildPatientsTab(onAddRequest: addRequest),
                buildRequestsTab(
                  requests: requests,
                  onRemoveRequest: removeRequest,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
