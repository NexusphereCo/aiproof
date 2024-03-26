import 'package:ai_proof/constants/theme.dart';
import 'package:ai_proof/modules/auth/index.dart';
import 'package:ai_proof/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        title: 'AI.Proof',
        theme: APTheme.data(),
        routes: Routes.routes,
        home: TestPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
