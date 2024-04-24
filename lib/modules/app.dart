import 'package:aiproof/constants/theme.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
