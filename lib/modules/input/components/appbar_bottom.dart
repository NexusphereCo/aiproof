import 'package:aiproof/modules/input/components/ai_overlay.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/modules/input/components/plagiarism_overlay.dart';
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
  final _aiController = OverlayPortalController();
  final _plagiarismController = OverlayPortalController();

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
                    Navigator.of(context).pushReplacement(createRoute(route: Routes.camera));
                  }
                },
                icon: const Icon(Remix.camera_2_line),
                tooltip: 'Scan Document',
              ),
              IconButton(
                onPressed: _aiController.toggle,
                icon: const Icon(Remix.brain_line),
                tooltip: 'AI Checker',
              ),
              IconButton(
                onPressed: _plagiarismController.toggle,
                icon: const Icon(Remix.file_warning_line),
                tooltip: 'Plagiarism Checker',
              ),
            ],
          ),
        ),
        OverlayPortal(
          controller: _plagiarismController,
          overlayChildBuilder: (BuildContext context) {
            return PlagiarismOverlay(
              overlayController: _plagiarismController,
              document: widget.document,
            );
          },
        ),
        OverlayPortal(
          controller: _aiController,
          overlayChildBuilder: (BuildContext context) {
            return AICheckerOverlay(
              overlayController: _aiController,
              document: widget.document,
            );
          },
        ),
      ],
    );
  }
}
