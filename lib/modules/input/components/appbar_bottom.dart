import 'package:aiproof/modules/input/components/overlay.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class APAppBarBottom extends StatefulWidget {
  final DocumentModel? document;
  const APAppBarBottom({super.key, this.document});

  @override
  State<APAppBarBottom> createState() => _APAppBarBottomState();
}

class _APAppBarBottomState extends State<APAppBarBottom> {
  final _overlayController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomAppBar(
          color: APColor.primary.withOpacity(0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  if (ModalRoute.of(context)?.settings.name != Routes.home) {
                    Navigator.of(context).push(createRoute(route: Routes.camera));
                  }
                },
                icon: const Icon(Remix.camera_2_line),
                tooltip: 'Scan Document',
              ),
              IconButton(
                onPressed: _overlayController.toggle,
                icon: const Icon(Remix.brain_line),
                tooltip: 'AI Checker',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Remix.file_warning_line),
                tooltip: 'Plagiarism Checker',
              ),
            ],
          ),
        ),
        OverlayPortal(
          controller: _overlayController,
          overlayChildBuilder: (BuildContext context) {
            return AICheckerOverlay(
              overlayController: _overlayController,
              document: widget.document,
            );
          },
        ),
      ],
    );
  }
}
