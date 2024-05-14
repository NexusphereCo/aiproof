part of 'document_bloc.dart';

abstract class DocumentState {}

class InitialDocumentState extends DocumentState {}

class LoadedDocumentState extends DocumentState {
  final List<DocumentModel> documents;

  LoadedDocumentState(this.documents);
}

class FilteredDocument extends DocumentState {
  final List<DocumentModel> documents;

  FilteredDocument(this.documents);
}

class ErrorDocument extends DocumentState {
  final String message;

  ErrorDocument(this.message);
}
