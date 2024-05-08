part of 'document_bloc.dart';

abstract class DocumentEvent {}

class LoadDocumentEvent extends DocumentEvent {}

class CreateDocumentEvent extends DocumentEvent {
  final DocumentModel document;

  CreateDocumentEvent(this.document);
}

class UpdateDocumentEvent extends DocumentEvent {
  final DocumentModel document;

  UpdateDocumentEvent(this.document);
}

class DeleteDocumentEvent extends DocumentEvent {
  final int id;

  DeleteDocumentEvent(this.id);
}

class FilterDocumentsEvent extends DocumentEvent {
  final String query;

  FilterDocumentsEvent(this.query);
}
