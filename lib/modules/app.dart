import 'package:ai_proof/constants/theme.dart';
import 'package:ai_proof/modules/auth/screens/homepage.dart';
import 'package:ai_proof/utils/routes.dart';

import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eBayan',
      theme: APTheme.data(),
      routes: Routes.routes,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
