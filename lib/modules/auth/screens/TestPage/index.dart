import 'package:ai_proof/constants/colors.dart';
import 'package:ai_proof/constants/sizes.dart';
import 'package:ai_proof/modules/auth/screens/TestPage/widgets/colorStyle.dart';
import 'package:ai_proof/modules/auth/screens/TestPage/widgets/iconStyle.dart';
import 'package:ai_proof/modules/auth/screens/TestPage/widgets/typographyStyle.dart';
import 'package:ai_proof/modules/auth/screens/TestPage/widgets/buttonStyle.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
        backgroundColor: APColor.primary[200],
      ),
      body: Expanded(
        flex: 1,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: Global.paddingBody, vertical: Global.paddingBody),
          children: const [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TypographyStyle(),
                    SizedBox(width: Spacing.md),
                    ColorStyle(),
                  ],
                ),
                SizedBox(height: Spacing.lg),
                IconStyle(),
                SizedBox(height: Spacing.lg),
                MyButtonStyle(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
