import 'package:aiproof/constants/assets.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/database/mock_database.dart';
import 'package:aiproof/modules/home/widgets/carousel/carousel_view.dart';
import 'package:aiproof/modules/home/widgets/grid/grid_view.dart';
import 'package:aiproof/modules/home/widgets/list/list_view.dart';
import 'package:aiproof/widgets/layout_components/appbar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remixicon/remixicon.dart';

enum View { list, carousel, grid }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  View documentView = View.carousel;

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
                            Transform.scale(
                              alignment: Alignment.topCenter,
                              scale: 0.8,
                              child: SegmentedButton<View>(
                                segments: const <ButtonSegment<View>>[
                                  ButtonSegment<View>(
                                    value: View.list,
                                    icon: Icon(Remix.list_unordered),
                                  ),
                                  ButtonSegment<View>(
                                    value: View.carousel,
                                    icon: Icon(Remix.carousel_view),
                                  ),
                                  ButtonSegment<View>(
                                    value: View.grid,
                                    icon: Icon(Remix.gallery_view_2),
                                  ),
                                ],
                                selected: <View>{documentView},
                                onSelectionChanged: (Set<View> value) {
                                  setState(() {
                                    documentView = value.first;
                                  });
                                },
                                showSelectedIcon: false,
                                style: ButtonStyle(
                                  iconColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return APColor.dark; // Use the color you want when selected
                                      }
                                      return APColor.dark.withOpacity(0.5); // Use the default value when not selected
                                    },
                                  ),
                                  side: MaterialStatePropertyAll(BorderSide(color: APColor.primary.withOpacity(0.1))),
                                  foregroundColor: MaterialStateProperty.all(APColor.dark),
                                  enableFeedback: true,
                                  iconSize: MaterialStateProperty.all(26.0),
                                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20)),
                                  overlayColor: MaterialStateProperty.all(APColor.primary[100]),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(APBorderRadius.sm))),
                                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return APColor.primary.withOpacity(0.3); // Use the color you want when selected
                                      }
                                      return APColor.light.withOpacity(0); // Use the default value when not selected
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: () {
              if (documentView == View.carousel) {
                return MyCarouselView(documents: mockDatabase);
              } else if (documentView == View.list) {
                return MyListView(documents: mockDatabase);
              } else if (documentView == View.grid) {
                return MyGridView(documents: mockDatabase);
              }
              // Add a default view in case none of the conditions match
              return Container();
            }(),
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
