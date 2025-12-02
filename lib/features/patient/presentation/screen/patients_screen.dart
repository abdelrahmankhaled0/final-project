import 'package:flutter/material.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/patient/data/models/patient_model.dart';
import 'package:final_project/features/patient/data/patient_data_store.dart';
import 'package:final_project/features/patient/presentation/widget/build_show_request_dialog_screen.dart';
import 'package:hive/hive.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PatientDataStore _store = PatientDataStore();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _addRequest(PatientRequest req) {
    _store.addRequest(req);
    _tabController.animateTo(1);
  }

  void _removeRequest(String id) => _store.removeRequest(id);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _patientsTab(BuildContext context) {
    final patients = [
      Patient(
        name: "Mohamed Ahmed",
        status: "Stable",
        room: "ICU-01",
        doctor: "Dr. Salma",
        statusColor: "green",
      ),
      Patient(
        name: "Ali Youssef",
        status: "Critical",
        room: "ICU-02",
        doctor: "Dr. Karim",
        statusColor: "red",
      ),
      Patient(
        name: "Nour Adel",
        status: "Under Observation",
        room: "ICU-03",
        doctor: "Dr. Ahmed",
        statusColor: "orange",
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: patients.length,
      itemBuilder: (context, index) {
        final patient = patients[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.borderColor, width: 1.2),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.person, color: AppColors.primaryColor),
            title: Text(
              patient.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("${patient.status} - ${patient.room}"),
            trailing: IconButton(
              icon: const Icon(
                Icons.add_circle_outline,
                color: AppColors.primaryColor,
              ),
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (_) => AddRequestDialog(
                    patient: patient,
                    onSubmit: (req) {
                      _addRequest(req);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Request added for ${req.patientName} ✅",
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _requestsTab(BuildContext context) {
    Color getPriorityColor(String priority) {
      switch (priority) {
        case "High":
          return Colors.orange;
        case "Critical":
          return Colors.red;
        default:
          return AppColors.grayColor;
      }
    }

    return ValueListenableBuilder(
      valueListenable: _store.listenable,
      builder: (context, Box<PatientRequest> box, _) {
        final requests = box.values.toList().reversed.toList();

        if (requests.isEmpty) {
          return const Center(
            child: Text(
              "No requests yet.",
              style: TextStyle(color: AppColors.grayColor),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: requests.length,
          itemBuilder: (context, index) {
            final req = requests[index];
            final color = getPriorityColor(req.priority);

            return Dismissible(
              key: ValueKey(req.id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.redAccent,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (_) => _removeRequest(req.id),
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(
                    color: AppColors.borderColor,
                    width: 1.2,
                  ),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.notifications_active_outlined,
                    color: AppColors.primaryColor,
                  ),
                  title: Text(
                    req.patientName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("${req.requestType} (${req.priority})"),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                    ),
                    onPressed: () => _removeRequest(req.id),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: AppColors.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(color: AppColors.borderColor),
                        ),
                        title: const Text(
                          "Request Details",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Patient: ${req.patientName}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text("Type: ${req.requestType}"),
                            Text(
                              "Priority: ${req.priority}",
                              style: TextStyle(color: color),
                            ),
                            const SizedBox(height: 10),
                            Text("Details:\n${req.details}"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              _removeRequest(req.id);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Reject",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Accept"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        children: [
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
              children: [_patientsTab(context), _requestsTab(context)],
            ),
          ),
        ],
      ),
    );
  }
}
