import 'package:final_project/features/icu/data/model/icu_model.dart';
import 'package:final_project/features/icu/presentation/widget/beds_tab.dart';
import 'package:final_project/features/icu/presentation/widget/requests_tab.dart';
import 'package:flutter/material.dart';
import 'package:final_project/core/utils/colors.dart';

class ICUBedsScreen extends StatefulWidget {
  const ICUBedsScreen({super.key});

  @override
  State<ICUBedsScreen> createState() => _ICUBedsScreenState();
}

class _ICUBedsScreenState extends State<ICUBedsScreen> {
  final List<ICUBed> beds = [
    ICUBed(id: 'ICU-01', status: 'Available'),
    ICUBed(id: 'ICU-02', status: 'Occupied', patient: 'Ahmed Mohamed'),
    ICUBed(id: 'ICU-03', status: 'Cleaning'),
    ICUBed(id: 'ICU-04', status: 'Available'),
    ICUBed(id: 'ICU-05', status: 'Occupied', patient: 'Mona Ali'),
  ];

  final List<ICURequest> requests = [
    ICURequest(id: 'REQ-01', patient: 'Ali Hassan', priority: 'High'),
    ICURequest(id: 'REQ-02', patient: 'Sara Mahmoud', priority: 'Medium'),
    ICURequest(id: 'REQ-03', patient: 'Khaled Omar', priority: 'Low'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الـ TabBar فوق داخل الـ body
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TabBar(
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.grayColor,
                tabs: [
                  Tab(text: "Available Beds"),
                  Tab(text: "Requests"),
                ],
              ),
            ),

            // المساحة لباقي المحتوى (الـ TabBarView)
            Expanded(
              child: TabBarView(
                children: [
                  BedsTab(beds: beds),
                  RequestsTab(requests: requests),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
