import 'package:ai_proof/constants/colors.dart';
import 'package:ai_proof/constants/sizes.dart';
import 'package:ai_proof/constants/typography.dart';
import 'package:flutter/material.dart';

class ColorStyle extends StatelessWidget {
  const ColorStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const h1(text: "Colors Style"),
        const SizedBox(height: Spacing.sm),
        Container(
          width: 100.0,
          height: 50.0,
          color: APColor.dark,
          child: Center(
            child: label(
              text: "Dark",
              color: APColor.light,
            ),
          ),
        ),
        Container(
          width: 100.0,
          height: 50.0,
          color: APColor.primary,
          child: Center(
            child: label(
              text: "Primary",
              color: APColor.light,
            ),
          ),
        ),
        Container(
          width: 100.0,
          height: 50.0,
          color: APColor.secondary,
          child: Center(
            child: label(
              text: "Secondary",
              color: APColor.light,
            ),
          ),
        ),
        Container(
          width: 100.0,
          height: 50.0,
          color: APColor.danger,
          child: Center(
            child: label(
              text: "Danger",
              color: APColor.light,
            ),
          ),
        ),
        Container(
          width: 100.0,
          height: 50.0,
          color: APColor.light,
          child: Center(
            child: label(
              text: "Light",
              color: APColor.dark,
            ),
          ),
        ),
      ],
    );
  }
}
