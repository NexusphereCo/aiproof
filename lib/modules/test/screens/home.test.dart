import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/modules/test/screens/buttons.test.dart';
import 'package:aiproof/widgets/layout_components/appbar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class TestHomeScreen extends StatelessWidget {
  const TestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: APTypography.h1("Test Page"),
        backgroundColor: APColor.primary[200],
      ),
      body: Expanded(
        flex: 1,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: Global.paddingBody, vertical: Global.paddingBody),
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        APTypography.h1("Typography Style"),
                        const SizedBox(height: Spacing.sm),
                        APTypography.h1("Heading 1"),
                        APTypography.h2("Heading 2"),
                        APTypography.h3("Heading 3"),
                        APTypography.h4("Heading 4"),
                        APTypography.base("Normal text"),
                        APTypography.label("Label text"),
                        APTypography.small("Small text"),
                      ],
                    ),
                    const SizedBox(width: Spacing.md),
                    Column(
                      children: [
                        APTypography.h1("Colors Style"),
                        const SizedBox(height: Spacing.sm),
                        Container(
                          width: 100.0,
                          height: 50.0,
                          color: APColor.dark,
                          child: Center(
                            child: APTypography.label(
                              "Dark",
                              color: APColor.light,
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 50.0,
                          color: APColor.primary,
                          child: Center(
                            child: APTypography.label(
                              "Primary",
                              color: APColor.light,
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 50.0,
                          color: APColor.secondary,
                          child: Center(
                            child: APTypography.label(
                              "Secondary",
                              color: APColor.light,
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 50.0,
                          color: APColor.danger,
                          child: Center(
                            child: APTypography.label(
                              "Danger",
                              color: APColor.light,
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 50.0,
                          color: APColor.light,
                          child: Center(
                            child: APTypography.label(
                              "Light",
                              color: APColor.dark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.lg),
                Column(
                  children: [
                    APTypography.h1("Icons Style"),
                    const SizedBox(height: Spacing.sm),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Remix.home_4_line),
                        Icon(Remix.qr_scan_2_line),
                        Icon(Remix.camera_line),
                        Icon(Remix.list_unordered),
                        Icon(Remix.carousel_view),
                        Icon(Remix.gallery_view_2),
                        Icon(Remix.sort_desc),
                        Icon(Remix.file_search_line),
                      ],
                    ),
                    const SizedBox(height: Spacing.md),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Remix.arrow_left_line),
                        Icon(Remix.loop_right_line),
                        Icon(Remix.download_line),
                        Icon(Remix.close_line),
                        Icon(Remix.arrow_down_s_line),
                        Icon(Remix.verified_badge_line),
                        Icon(Remix.share_line),
                        Icon(Remix.more_line),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.lg),
                const TestButtons(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
