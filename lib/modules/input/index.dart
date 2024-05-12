import 'package:aiproof/business_logic/appbar/appbar_bloc.dart';
import 'package:aiproof/business_logic/document/document_bloc.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:aiproof/widgets/layouts/appbar_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remixicon/remixicon.dart';

class InputScreen extends StatefulWidget {
  final DocumentModel? document;

  const InputScreen({super.key, this.document});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final titleFocusNode = FocusNode();
  final contentFocusNode = FocusNode();

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

  @override
  Widget build(BuildContext context) {
    final DocumentModel? document = ModalRoute.of(context)?.settings.arguments as DocumentModel?;
    return document == null ? buildCreateWidget(context) : buildEditWidget(context, document);
  }

  Widget buildCreateWidget(BuildContext context) {
    final titleController = TextEditingController(text: 'Untitled Document');
    final contentController = TextEditingController();

    return Scaffold(
      appBar: APAppBar(
        onDonePressed: () {
          final title = titleController.text.isNotEmpty ? titleController.text : 'Untitled Document';
          final document = DocumentModel(
            title: title,
            content: contentController.text,
            createdAt: DateTime.now(),
          );

          context.read<DocumentBloc>().add(CreateDocumentEvent(document));
          titleController.text = title;
        },
        onDeletePressed: () {
          context.read<DocumentBloc>().add(DeleteDocumentEvent(0));
          Navigator.pop(context);
        },
        onBackPressed: () {
          final title = titleController.text.isNotEmpty ? titleController.text : 'Untitled Document';
          final document = DocumentModel(
            title: title,
            content: contentController.text,
            createdAt: DateTime.now(),
          );

          context.read<DocumentBloc>().add(CreateDocumentEvent(document));
          titleController.text = title;
        },
        titleFocusNode: titleFocusNode,
        contentFocusNode: contentFocusNode,
      ),
      body: SingleChildScrollView(
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
      bottomNavigationBar: BottomAppBar(
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
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget buildEditWidget(BuildContext context, DocumentModel document) {
    final titleController = TextEditingController(text: document.title.isNotEmpty ? document.title : 'Untitled Document');
    final contentController = TextEditingController(text: document.content);

    return Scaffold(
      appBar: APAppBar(
        onDonePressed: () {
          final title = titleController.text.isNotEmpty ? titleController.text : 'Untitled Document';
          final updatedDocument = DocumentModel(
            id: document.id,
            title: title,
            content: contentController.text,
            createdAt: (document.title != titleController.text || document.content != contentController.text) ? DateTime.now() : document.createdAt,
          );

          context.read<DocumentBloc>().add(UpdateDocumentEvent(updatedDocument));
          titleController.text = title;
        },
        onDeletePressed: () {
          context.read<DocumentBloc>().add(DeleteDocumentEvent(document.id as int));
          Navigator.pop(context);
        },
        onBackPressed: () {
          final title = titleController.text.isNotEmpty ? titleController.text : 'Untitled Document';
          final updatedDocument = DocumentModel(
            id: document.id,
            title: title,
            content: contentController.text,
            createdAt: (document.title != titleController.text || document.content != contentController.text) ? DateTime.now() : document.createdAt,
          );

          context.read<DocumentBloc>().add(UpdateDocumentEvent(updatedDocument));
          titleController.text = title;
        },
        titleFocusNode: titleFocusNode,
        contentFocusNode: contentFocusNode,
      ),
      body: SingleChildScrollView(
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
      bottomNavigationBar: BottomAppBar(
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
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
