import 'package:aiproof/constants/assets.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Spacing.xl),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              Asset.logo,
              height: 50,
              width: 50,
            ),
            const SizedBox(width: Spacing.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                APTypography.h1("aiprof", color: APColor.light),
                APTypography.small("Nexusphere", color: APColor.light),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
