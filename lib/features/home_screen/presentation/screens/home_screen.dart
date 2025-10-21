import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/blood_donors/presentation/screens/blood_donors.dart';
import 'package:final_project/features/blood_stook/presentation/screen/blood_stock.dart';
import 'package:final_project/features/icu/presentation/screen/icu_screen.dart';
import 'package:final_project/features/patient/presentation/screen/patients_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Pages
  static final List<Widget> _pages = <Widget>[
    Center(child: PatientScreen()),
    const Center(child: BloodDonorsScreen()),
    const Center(child: BloodStockScreen()),
    const Center(child: ICUBedsScreen()),
  ];

  List<String> appBarTitles = [
    "Patient Management",
    "Blood Donors",
    "Blood Stock",
    "ICU Beds Management",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitles[_selectedIndex],
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Patients',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Donors'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'Stock'),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart_outlined),
            label: 'ICU',
          ),
        ],
      ),
    );
  }
}
