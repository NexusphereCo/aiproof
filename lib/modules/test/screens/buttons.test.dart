import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/widgets/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class TestButtons extends StatelessWidget {
  const TestButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            APTypography.h1("Button Theme"),
            const SizedBox(height: Spacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const APBackButton(),
                IconButton(onPressed: () {}, icon: const Icon(Remix.download_line)),
                APNavButton(onPressed: () {}, icon: Remix.more_line, text: "More", isActive: true),
              ],
            ),
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
            APButton(
              text: "Icon",
              theme: APButtonTheme.dark,
              size: APButtonSize.lg,
              icon: Icon(
                Remix.download_2_line,
                color: APColor.light,
                size: APFontSize.h3,
              ),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: Spacing.lg),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            APTypography.h1("Button Size"),
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
