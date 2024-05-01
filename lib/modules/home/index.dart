import 'package:aiproof/constants/assets.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/database/mock_database.dart';
import 'package:aiproof/modules/home/components/header_logo.dart';
import 'package:aiproof/modules/home/components/search_bar.dart';
import 'package:aiproof/modules/home/components/view_toggle.dart';
import 'package:aiproof/modules/home/enums/doc_view.dart';
import 'package:aiproof/modules/home/widgets/carousel/carousel_view.dart';
import 'package:aiproof/modules/home/widgets/grid/grid_view.dart';
import 'package:aiproof/modules/home/widgets/list/list_view.dart';
import 'package:aiproof/widgets/layouts/appbar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remixicon/remixicon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DocView _currentView = DocView.carousel;

  void _handleViewChange(DocView newView) {
    setState(() {
      _currentView = newView;
    });
  }

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
                    const HeaderLogo(),
                    const SizedBox(height: Spacing.xl),
                    const APSearchBar(),
                    const SizedBox(height: Spacing.xxxl),
                    ViewToggle(
                      documentView: _currentView,
                      onViewChanged: _handleViewChange,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: () {
              if (_currentView == DocView.carousel) {
                return APCarouselView(documents: mockDatabase);
              } else if (_currentView == DocView.list) {
                return APListView(documents: mockDatabase);
              } else if (_currentView == DocView.grid) {
                return APGridView(documents: mockDatabase);
              }
              // Add a default view in case none of the conditions match
              return Container();
            }(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // open a modalsheet
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return SizedBox(
                height: 220,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // add a line
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: Spacing.md),
                        height: 4,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Remix.speak_line, size: APSize.xl),
                        title: const Text('Text-to-Speech'),
                        onTap: () {
                          // Handle text-to-speech option
                        },
                      ),
                      ListTile(
                        leading: const Icon(Remix.gallery_line, size: APSize.xl),
                        title: const Text('Scan from Image'),
                        onTap: () {
                          // Handle AI checker option
                        },
                      ),
                      ListTile(
                        leading: const Icon(Remix.brain_line, size: APSize.xl),
                        title: const Text('AI Checker'),
                        onTap: () {
                          // Handle AI checker option
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(
          Remix.camera_line,
          size: APSize.xl,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const APAppBarBottom(activeIndex: 1),
      resizeToAvoidBottomInset: false,
    );
  }
}
