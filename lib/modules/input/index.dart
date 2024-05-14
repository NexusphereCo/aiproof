import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/modules/input/components/create.dart';
import 'package:aiproof/modules/input/components/edit.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  final DocumentModel? document;

  const InputScreen({super.key, this.document});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    final DocumentModel? document = ModalRoute.of(context)?.settings.arguments as DocumentModel?;

    return document == null ? CreateDocument(document: widget.document) : EditDocument(document: document);
  }
}
