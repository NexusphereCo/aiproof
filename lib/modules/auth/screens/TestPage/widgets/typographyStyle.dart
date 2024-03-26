import 'package:ai_proof/constants/sizes.dart';
import 'package:ai_proof/constants/typography_test.dart';
import 'package:flutter/material.dart';

class TypographyStyle extends StatelessWidget {
  const TypographyStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        h1(text: "Typography Style"),
        SizedBox(height: Spacing.sm),
        h1(text: "Heading 1"),
        h2(text: "Heading 2"),
        h3(text: "Heading 3"),
        h4(text: "Heading 4"),
        text(text: "Normal text"),
        label(text: "Label text"),
        small(text: "Small text"),
      ],
    );
  }
}
