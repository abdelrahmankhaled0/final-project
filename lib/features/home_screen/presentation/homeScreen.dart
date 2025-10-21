import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/home_screen/presentation/bloodDonors.dart';
import 'package:final_project/features/home_screen/presentation/bloodStock.dart';
import 'package:final_project/features/home_screen/presentation/icuScreen.dart';
import 'package:final_project/features/home_screen/presentation/patients.dart';
import 'package:flutter/material.dart';
import '../../../core/routes/navigations.dart';
import '../../../core/routes/routes.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Pages
  static final List<Widget> _pages = <Widget>[
    Center(
      child:
        PatientScreen()
    ),
    const Center(
      child:
        BloodDonorsScreen()
    ),
    const Center(
      child: BloodStockScreen(),
    ),
    const Center(
      child:
      ICUBedsScreen(),

    ),
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
        title: const Text('ICU & Blood Bank Management',style: TextStyle(color: Colors.white),),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Donors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Stock',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart_outlined),
            label: 'ICU',
          ),
        ],
      ),
    );
  }
}