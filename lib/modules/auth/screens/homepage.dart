import 'package:ai_proof/constants/colors.dart';
import 'package:ai_proof/constants/typography.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: APTypography.h1(text: "Hello World", color: APColor.dark[400], fontWeight: APFontWeight.bold),
      ),
    );
  }
}
