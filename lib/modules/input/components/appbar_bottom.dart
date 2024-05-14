import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class APAppBarBottom extends StatelessWidget {
  const APAppBarBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: APColor.light,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              if (ModalRoute.of(context)?.settings.name != Routes.home) {
                Navigator.of(context).push(createRoute(route: Routes.camera));
              }
            },
            icon: const Icon(
              Remix.camera_2_line,
            ),
            tooltip: 'Scan Document',
          ),
          IconButton(
            onPressed: () {
              if (ModalRoute.of(context)?.settings.name != Routes.input) {
                Navigator.of(context).push(createRoute(route: Routes.input));
              }
            },
            icon: const Icon(
              Remix.brain_line,
            ),
            tooltip: 'AI Checker',
          ),
          IconButton(
            onPressed: () {
              if (ModalRoute.of(context)?.settings.name != Routes.input) {
                Navigator.of(context).push(createRoute(route: Routes.input));
              }
            },
            icon: const Icon(
              Remix.file_warning_line,
            ),
            tooltip: 'Plagiarism Checker',
          ),
        ],
      ),
    );
  }
}
