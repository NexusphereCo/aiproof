import 'package:aiproof/constants/assets.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/widgets/components/buttons.dart';
import 'package:aiproof/widgets/layout_components/appbar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aiproof/constants/typography.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              Padding(
                padding: const EdgeInsets.all(Global.paddingBody),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    const SizedBox(height: Spacing.xl),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        APTypography.h1("Greetings!", color: APColor.light),
                        const SizedBox(height: Spacing.sm),
                        TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search, color: APColor.primary),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(APBorderRadius.md)),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(APBorderRadius.md)),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(APBorderRadius.md)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(color: APColor.primary),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: Spacing.xxl),
                    const SizedBox(height: Spacing.md),
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            APTypography.base("6 items"),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Remix.sort_alphabet_asc),
                                    iconSize: 20,
                                  ),
                                  APTypography.base("Sort"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            APViewButton(
                              onPressed: () {},
                              icon: Remix.list_unordered,
                              isActive: true,
                              isLeft: true,
                            ),
                            APViewButton(
                              onPressed: () {},
                              icon: Remix.carousel_view,
                              isActive: false,
                            ),
                            APViewButton(
                              onPressed: () {},
                              icon: Remix.gallery_view_2,
                              isActive: false,
                              isRight: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Remix.camera_line,
          size: 25,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const APAppBarBottom(activeIndex: 1),
      resizeToAvoidBottomInset: false,
    );
  }
}
