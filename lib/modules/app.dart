import 'package:aiproof/constants/theme.dart';
import 'package:aiproof/utils/routes.dart';
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
        title: 'aiproof',
        theme: APTheme.data(),
        routes: Routes.routes,
        initialRoute: Routes.home,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
