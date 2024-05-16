import 'package:aiproof/modules/input/components/ai_overlay.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/modules/input/components/plagiarism_overlay.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:remixicon/remixicon.dart';

class APAppBarBottom extends StatefulWidget {
  final DocumentModel? document;
  final Function(DocumentModel)? onDocumentScanned;

  const APAppBarBottom({super.key, required this.document, this.onDocumentScanned});

  @override
  State<APAppBarBottom> createState() => _APAppBarBottomState();
}

class _APAppBarBottomState extends State<APAppBarBottom> {
  final _aiController = OverlayPortalController();
  final _plagiarismController = OverlayPortalController();
  Logger log = Logger();

  @override
  Widget build(BuildContext context) {
    log.i(widget.document?.content);
    log.i(widget.document?.id);
    log.i(widget.document);
    return Stack(
      children: [
        BottomAppBar(
          color: APColor.primary.withOpacity(0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () async {
                  if (ModalRoute.of(context)?.settings.name != Routes.home) {
                    final scannedDoc = await Navigator.of(context).push(createRoute(route: Routes.camera));
                    if (scannedDoc != null) {
                      widget.onDocumentScanned?.call(scannedDoc);
                    }
                  }
                },
                icon: const Icon(Remix.camera_2_line),
                tooltip: 'Scan Document',
              ),
              IconButton(
                onPressed: () {
                  if (widget.document != null) {
                    _aiController.toggle();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Document is empty!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                icon: const Icon(Remix.brain_line),
                tooltip: 'AI Checker',
              ),
              IconButton(
                onPressed: () {
                  if (widget.document != null) {
                    _plagiarismController.toggle();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Document is empty!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                icon: const Icon(Remix.file_warning_line),
                tooltip: 'Plagiarism Checker',
              ),
            ],
          ),
        ),
        if (widget.document != null)
          OverlayPortal(
            controller: _plagiarismController,
            overlayChildBuilder: (BuildContext context) {
              return PlagiarismOverlay(
                overlayController: _plagiarismController,
                content: widget.document!.content,
              );
            },
          ),
        if (widget.document != null)
          OverlayPortal(
            controller: _aiController,
            overlayChildBuilder: (BuildContext context) {
              return AICheckerOverlay(
                overlayController: _aiController,
                content: widget.document!.content,
              );
            },
          ),
      ],
    );
  }
}
