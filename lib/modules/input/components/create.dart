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

class CreateDocument extends StatefulWidget {
  final DocumentModel? document;

  const CreateDocument({super.key, required this.document});

  @override
  State<CreateDocument> createState() => _CreateDocumentState();
}

class _CreateDocumentState extends State<CreateDocument> {
  final titleFocusNode = FocusNode();
  final contentFocusNode = FocusNode();
  final GlobalKey globalKey = GlobalKey();

  final titleController = TextEditingController(text: 'Untitled Document');
  final contentController = TextEditingController();

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

    context.read<DocumentBloc>().add(CreateDocumentEvent(document));
    titleController.text = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: APAppBar(
        onDonePressed: () {},
        onDeletePressed: () {
          context.read<DocumentBloc>().add(DeleteDocumentEvent(widget.document?.id as int));
          Navigator.pop(context);
        },
        onBackPressed: () async {
          await saveDocument();
        },
        titleFocusNode: titleFocusNode,
        contentFocusNode: contentFocusNode,
      ),
      body: SingleChildScrollView(
        child: RepaintBoundary(
          key: globalKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Global.paddingBody),
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
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    ),
                    autofocus: true,
                    minLines: 1,
                    maxLines: 3,
                    maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                    maxLength: 255,
                  ),
                  TextField(
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
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    ),
                    maxLength: 8000,
                    maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                    maxLines: null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const APAppBarBottom(),
      resizeToAvoidBottomInset: false,
    );
  }
}
