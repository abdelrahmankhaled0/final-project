import 'package:flutter/material.dart';
import 'package:final_project/core/routes/routes.dart';
import 'package:final_project/core/utils/themes.dart';
import 'package:final_project/features/patient/data/models/patient_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(PatientRequestAdapter());

  await Hive.openBox<PatientRequest>('requestsBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.routes,
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
