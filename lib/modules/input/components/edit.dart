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

class EditDocument extends StatefulWidget {
  const EditDocument({super.key});

  @override
  State<EditDocument> createState() => _EditDocumentState();
}

class _EditDocumentState extends State<EditDocument> {
  late DocumentModel document;
  late TextEditingController titleController;
  late TextEditingController contentController;
  final titleFocusNode = FocusNode();
  final contentFocusNode = FocusNode();
  final GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
    titleFocusNode.addListener(_handleFocusChange);
    contentFocusNode.addListener(_handleFocusChange);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    document = ModalRoute.of(context)?.settings.arguments as DocumentModel;
    titleController.text = document.title.isNotEmpty ? document.title : 'Untitled Document';
    contentController.text = document.content;
  }

  @override
  void dispose() {
    titleFocusNode.removeListener(_handleFocusChange);
    contentFocusNode.removeListener(_handleFocusChange);
    titleFocusNode.dispose();
    contentFocusNode.dispose();
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    final hasFocus = titleFocusNode.hasFocus || contentFocusNode.hasFocus;
    context.read<AppBarBloc>().add(FocusChangedEvent(hasFocus));
  }

  Future<void> saveDocument() async {
    final title = titleController.text.isNotEmpty ? titleController.text : 'Untitled Document';
    final thumbnail = await capturePng(globalKey);
    final updatedDocument = DocumentModel(
      id: document.id,
      title: title,
      content: contentController.text,
      createdAt: (document.title != titleController.text || document.content != contentController.text) ? DateTime.now() : document.createdAt,
      thumbnail: thumbnail,
    );

    context.read<DocumentBloc>().add(UpdateDocumentEvent(updatedDocument));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: APAppBar(
        onDonePressed: () async {
          await saveDocument();
          Navigator.pop(context);
        },
        onDeletePressed: () {
          context.read<DocumentBloc>().add(DeleteDocumentEvent(document.id!));
          Navigator.pop(context);
        },
        onBackPressed: () async {
          await saveDocument();
          Navigator.pop(context);
        },
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
