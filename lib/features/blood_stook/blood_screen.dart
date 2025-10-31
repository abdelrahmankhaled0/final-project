import 'package:final_project/features/blood_stook/data/models/blood_stock_model.dart';
import 'package:flutter/material.dart';
import 'package:final_project/core/utils/colors.dart';

class BloodScreen extends StatefulWidget {
  const BloodScreen({super.key});

  @override
  State<BloodScreen> createState() => _BloodScreenState();
}

class _BloodScreenState extends State<BloodScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // بيانات مخزون الدم
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

  // بيانات الطلبات
  final List<BloodRequest> requests = [
    BloodRequest(
      id: 'REQ-101',
      patient: 'Ahmed Khaled',
      bloodType: 'A+',
      units: 2,
      priority: 'High',
    ),
    BloodRequest(
      id: 'REQ-102',
      patient: 'Mona Ali',
      bloodType: 'O-',
      units: 3,
      priority: 'Critical',
    ),
    BloodRequest(
      id: 'REQ-103',
      patient: 'Sara Hussein',
      bloodType: 'B+',
      units: 1,
      priority: 'Normal',
    ),
  ];

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

  Color getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.orange;
      case 'Critical':
        return Colors.red;
      default:
        return AppColors.grayColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        children: [
          const SizedBox(height: 12),
          // التابات فوق
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderColor, width: 1),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.darkColor,
              tabs: const [
                Tab(text: "Blood Stock"),
                Tab(text: "Requests"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildStockTab(), _buildRequestsTab()],
            ),
          ),
        ],
      ),
    );
  }

  // تبويب مخزون الدم
  Widget _buildStockTab() {
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
                              style: const TextStyle(
                                color: AppColors.darkColor,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
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
          );
        },
      ),
    );
  }

  // تبويب الطلبات
  Widget _buildRequestsTab() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final req = requests[index];
          final color = getPriorityColor(req.priority);

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: AppColors.borderColor, width: 1.2),
            ),
            elevation: 3,
            child: ListTile(
              leading: const Icon(
                Icons.bloodtype,
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
                "Blood Type: ${req.bloodType}  |  Units: ${req.units}",
                style: const TextStyle(color: AppColors.grayColor),
              ),
              trailing: Text(
                req.priority,
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
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
                        const Text(
                          "Request Details",
                          style: TextStyle(
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
                          "Blood Type: ${req.bloodType}",
                          style: const TextStyle(color: AppColors.grayColor),
                        ),
                        Text(
                          "Units Needed: ${req.units}",
                          style: const TextStyle(color: AppColors.grayColor),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Priority: ${req.priority}",
                          style: TextStyle(color: color),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Notes:\n- Immediate supply needed\n- Check donor compatibility\n- Coordinate with blood bank",
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
                                // هنا كود الرفض
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
                                // هنا كود القبول
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
