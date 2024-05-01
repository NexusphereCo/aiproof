import 'package:aiproof/constants/assets.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/modules/home/components/header_logo.dart';
import 'package:aiproof/modules/home/components/search_bar.dart';
import 'package:aiproof/widgets/common/buttons.dart';
import 'package:aiproof/widgets/layouts/appbar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remixicon/remixicon.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              Positioned(
                child: SvgPicture.asset(Asset.heading, fit: BoxFit.fill),
              ),
              const Padding(
                padding: EdgeInsets.all(Global.paddingBody),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HeaderLogo(),
                    SizedBox(height: Spacing.xl),
                    APSearchBar(),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Global.paddingBody),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Remix.arrow_left_wide_line),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text('Back'),
                    ],
                  ),
                  APTypography.h1("Scan Input"),
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
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(0.0)),
                    ),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [Color.fromRGBO(25, 151, 156, 1), Color.fromRGBO(22, 114, 144, 1)]),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(Spacing.lg),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            APTypography.base('Verify', color: APColor.light),
                            const SizedBox(width: Spacing.md),
                            Icon(Remix.verified_badge_line, color: APColor.light, size: APSize.xl),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const APAppBarBottom(activeIndex: 2),
    );
  }
}
