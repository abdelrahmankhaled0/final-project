import 'package:final_project/features/blood_stook/presentation/widgets/biuld_requests_tab.dart';
import 'package:final_project/features/blood_stook/presentation/widgets/build_stock_tab.dart';
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(),
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.grayColor,
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
              children: [buildStockTab(), buildRequestsTab()],
            ),
          ),
        ],
      ),
    );
  }
}
