import 'package:aiproof/data/database/database_service.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'document_event.dart';
part 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final DatabaseServices databaseServices;
  List<DocumentModel> documents = [];

  @override
  Future<void> close() {
    databaseServices.closeDatabase();
    return super.close();
  }

  DocumentBloc(this.databaseServices) : super(InitialDocumentState()) {
    on<LoadDocumentEvent>(_loadDocuments);
    on<CreateDocumentEvent>(_createDocument);
    on<DeleteDocumentEvent>(_deleteDocument);
    on<UpdateDocumentEvent>(_updateDocument);
    on<FilterDocumentsEvent>(_filterDocuments);
  }

  void _loadDocuments(LoadDocumentEvent event, Emitter<DocumentState> emit) async {
    try {
      documents = await databaseServices.fetchDocuments();
      emit(LoadedDocumentState(documents));
    } catch (e) {
      emit(ErrorDocument(e.toString()));
    }
  }

  void _createDocument(CreateDocumentEvent event, Emitter<DocumentState> emit) async {
    try {
      await databaseServices.insertDocument(event.document);
      documents = await databaseServices.fetchDocuments();
      emit(LoadedDocumentState(documents));
    } catch (e) {
      emit(ErrorDocument(e.toString()));
    }
  }

  void _deleteDocument(DeleteDocumentEvent event, Emitter<DocumentState> emit) async {
    try {
      await databaseServices.deleteDocument(event.id);
      documents = await databaseServices.fetchDocuments();
      emit(LoadedDocumentState(documents));
    } catch (e) {
      emit(ErrorDocument(e.toString()));
    }
  }

  void _updateDocument(UpdateDocumentEvent event, Emitter<DocumentState> emit) async {
    try {
      await databaseServices.updateDocument(event.document);
      documents = await databaseServices.fetchDocuments();
      emit(LoadedDocumentState(documents));
    } catch (e) {
      emit(ErrorDocument(e.toString()));
    }
  }

  void _filterDocuments(FilterDocumentsEvent event, Emitter<DocumentState> emit) {
    final filteredDocuments = documents.where((document) {
      return document.title.toLowerCase().contains(event.query.toLowerCase());
    }).toList();
    emit(FilteredDocument(filteredDocuments));
  }
}
