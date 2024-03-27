import 'package:aiproof/constants/theme.dart';
import 'package:aiproof/database/database_service.dart';
import 'package:aiproof/modules/test/screens/home.test.dart';
import 'package:aiproof/utils/global.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  // initialize system settings
  WidgetsFlutterBinding.ensureInitialized();
  setSystemUIOverlayStyle();
  await setPreferredOrientations();

  DatabaseService databaseService = DatabaseService();

  // run the application
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'aiproof',
        theme: APTheme.data(),
        home: const TestHomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
