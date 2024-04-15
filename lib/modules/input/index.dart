import 'package:aiproof/widgets/layout_components/appbar_bottom.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Scan'),
      ),
      body: const Center(
        child: Text('Input Screen'),
      ),
      bottomNavigationBar: const APAppBarBottom(activeIndex: 2),
    );
  }
}
