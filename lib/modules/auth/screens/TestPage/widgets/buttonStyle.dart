import 'package:ai_proof/constants/colors.dart';
import 'package:ai_proof/constants/sizes.dart';
import 'package:ai_proof/constants/typography_test.dart';
import 'package:ai_proof/widgets/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class MyButtonStyle extends StatelessWidget {
  const MyButtonStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const h1(text: "Button Theme"),
            const SizedBox(height: Spacing.sm),
            APButton(
              text: "Outline",
              theme: APButtonTheme.darkOutlined,
              size: APButtonSize.lg,
              onPressed: () {},
            ),
            const SizedBox(height: Spacing.sm),
            APButton(
              text: "Fill",
              theme: APButtonTheme.dark,
              size: APButtonSize.lg,
              onPressed: () {},
            ),
            const SizedBox(height: Spacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                APButton(
                  text: "Icon",
                  theme: APButtonTheme.dark,
                  icon: Icon(
                    Remix.download_2_line,
                    color: APColor.light,
                    size: APFontSize.h3,
                  ),
                  onPressed: () {},
                ),
                IconButton(onPressed: () {}, icon: const Icon(Remix.download_2_line)),
              ],
            ),
          ],
        ),
        const SizedBox(height: Spacing.lg),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const h1(text: "Button Size"),
            const SizedBox(height: Spacing.sm),
            APButton(
              text: "Large",
              theme: APButtonTheme.dark,
              onPressed: () {},
              size: APButtonSize.lg,
            ),
            const SizedBox(height: Spacing.sm),
            APButton(
              text: "Medium",
              theme: APButtonTheme.dark,
              onPressed: () {},
              size: APButtonSize.md,
            ),
            const SizedBox(height: Spacing.sm),
            APButton(
              text: "Small",
              theme: APButtonTheme.dark,
              onPressed: () {},
              size: APButtonSize.sm,
            ),
          ],
        ),
      ],
    );
  }
}
