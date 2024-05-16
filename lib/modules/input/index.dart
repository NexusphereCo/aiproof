import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/modules/input/components/create.dart';
import 'package:aiproof/modules/input/components/edit.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    final DocumentModel? document = ModalRoute.of(context)?.settings.arguments as DocumentModel?;

    return document == null ? CreateDocument(document: document) : EditDocument(document: document);
  }
}
