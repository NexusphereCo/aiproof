import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/widgets/components/buttons.dart';
import 'package:aiproof/widgets/layout_components/appbar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(Global.paddingBody),
          child: Column(
            children: [
              Row(
                children: [
                  APTypography.h1("Scan Input"),
                ],
              ),
              const SizedBox(height: Spacing.md),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Content",
                    hintText: "Enter the content to be scanned",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(APBorderRadius.md),
                      borderSide: BorderSide(
                        color: APColor.dark.withOpacity(0.5),
                        width: 1.0,
                      ),
                    ),
                    hintStyle: TextStyle(color: APColor.dark.withOpacity(0.7), fontWeight: APFontWeight.thin),
                    labelStyle: TextStyle(color: APColor.dark),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(APBorderRadius.md),
                      borderSide: BorderSide(
                        color: APColor.dark[300]!,
                        width: 1.0,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always),
                minLines: 10,
                maxLines: 15,
                readOnly: false,
              ),
              const SizedBox(height: Spacing.xxl),
              APButton(
                onPressed: () {},
                text: "Verify",
                theme: APButtonTheme.dark,
                size: APButtonSize.lg,
                icon: Icon(
                  Remix.verified_badge_line,
                  color: APColor.light,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const APAppBarBottom(activeIndex: 2),
    );
  }
}
