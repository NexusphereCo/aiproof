import 'package:aiproof/business_logic/document/document_bloc.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:remixicon/remixicon.dart';

class InputScreen extends StatefulWidget {
  final DocumentModel? document;

  const InputScreen({super.key, this.document});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late FocusNode _titleFocusNode;
  late FocusNode _contentFocusNode;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.document?.title ?? '');
    _contentController = TextEditingController(text: widget.document?.content ?? '');
    _titleFocusNode = FocusNode();
    _contentFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _titleFocusNode.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }

  // String getArgs(BuildContext context) {
  //   final args = ModalRoute.of(context)?.settings.arguments as String? ?? '';
  //   return args;
  // }

  @override
  Widget build(BuildContext context) {
    // String arg = getArgs(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<DocumentBloc>().add(DeleteDocumentEvent(widget.document?.id ?? 0));
              Navigator.pop(context);
            },
            icon: const Icon(
              Remix.delete_bin_line,
            ),
          ),
          if (_titleFocusNode.hasFocus || _contentFocusNode.hasFocus)
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  final document = DocumentModel(
                    id: widget.document?.id,
                    title: _titleController.text,
                    content: _contentController.text,
                    createdAt: DateTime.now(),
                  );

                  if (widget.document == null) {
                    context.read<DocumentBloc>().add(CreateDocumentEvent(document));
                  } else {
                    context.read<DocumentBloc>().add(UpdateDocumentEvent(document));
                  }
                  Navigator.pop(context);
                }
              },
              child: APTypography.h3(
                'Done',
                color: APColor.dark,
                fontWeight: APFontWeight.regular,
              ),
            ),
          const SizedBox(width: APSize.lg),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Global.paddingBody),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              APTypography.base(widget.document?.createdAt.toIso8601String() ?? '', color: APColor.dark.withOpacity(0.5)),
              TextField(
                controller: _titleController,
                focusNode: _titleFocusNode,
                style: const TextStyle(
                  fontWeight: APFontWeight.bold,
                  fontSize: APFontSize.h1,
                  fontFamily: APTypography.fontFamily,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Title',
                  counterText: '',
                ),

                minLines: 1,
                maxLines: 3,
                maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                maxLength: 255, // Add this line to hide the character count
              ),
              TextField(
                controller: _contentController,
                focusNode: _contentFocusNode,
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
                ),
                maxLength: 8000,
                maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                maxLines: null,
              ),
            ],
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
