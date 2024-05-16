import 'package:aiproof/bloc/appbar/appbar_bloc.dart';
import 'package:aiproof/bloc/document/document_bloc.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/modules/input/components/appbar_bottom.dart';
import 'package:aiproof/modules/input/utils/capture_png.dart';
import 'package:aiproof/widgets/layouts/appbar_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class CreateDocument extends StatefulWidget {
  const CreateDocument({super.key});

  @override
  State<CreateDocument> createState() => _CreateDocumentState();
}

class _CreateDocumentState extends State<CreateDocument> {
  final titleFocusNode = FocusNode();
  final contentFocusNode = FocusNode();
  final GlobalKey globalKey = GlobalKey();
  final titleController = TextEditingController(text: 'Untitled Document');
  final contentController = TextEditingController();
  Logger log = Logger();

  @override
  void initState() {
    super.initState();
    titleFocusNode.addListener(_handleFocusChange);
    contentFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    titleFocusNode.removeListener(_handleFocusChange);
    contentFocusNode.removeListener(_handleFocusChange);
    titleFocusNode.dispose();
    contentFocusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    final hasFocus = titleFocusNode.hasFocus || contentFocusNode.hasFocus;
    context.read<AppBarBloc>().add(FocusChangedEvent(hasFocus));
  }

  Future<void> saveDocument() async {
    final title = titleController.text.isNotEmpty ? titleController.text : 'Untitled Document';
    final thumbnail = await capturePng(globalKey);
    final document = DocumentModel(
      title: title,
      content: contentController.text,
      createdAt: DateTime.now(),
      thumbnail: thumbnail,
    );
    log.i(document.content);

    context.read<DocumentBloc>().add(CreateDocumentEvent(document));
    titleController.text = title;
  }

  @override
  Widget build(BuildContext context) {
    DocumentModel? document = ModalRoute.of(context)?.settings.arguments as DocumentModel?;

    return Scaffold(
      appBar: APAppBar(
        onDonePressed: () async {
          await saveDocument();
        },
        onDeletePressed: () {
          if (document != null) {
            context.read<DocumentBloc>().add(DeleteDocumentEvent(document?.id as int));
          }
          Navigator.pop(context);
        },
        onBackPressed: () async {},
        titleFocusNode: titleFocusNode,
        contentFocusNode: contentFocusNode,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  focusNode: titleFocusNode,
                  style: TextStyle(
                    fontWeight: APFontWeight.regular,
                    fontSize: APFontSize.h1,
                    fontFamily: APTypography.fontFamily,
                    color: APColor.dark,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Title',
                    counterText: '',
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: Global.paddingBody),
                  ),
                  autofocus: true,
                  minLines: 1,
                  maxLines: 3,
                  maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                  maxLength: 255,
                ),
                RepaintBoundary(
                  key: globalKey,
                  child: TextField(
                    controller: contentController,
                    focusNode: contentFocusNode,
                    style: TextStyle(
                      fontWeight: APFontWeight.regular,
                      fontSize: APFontSize.normal,
                      fontFamily: APTypography.fontFamily,
                      color: APColor.dark,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Write something here...',
                      counterText: '',
                      contentPadding: EdgeInsets.symmetric(vertical: Global.paddingBody, horizontal: Global.paddingBody),
                    ),
                    maxLength: 8000,
                    maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                    maxLines: null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: APAppBarBottom(
        onDocumentScanned: (scannedDoc) {
          setState(() {
            contentController.text = scannedDoc.content;
          });
        },
        document: document,
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
