import 'package:aiproof/modules/home/enums/doc_view.dart';
import 'package:bloc/bloc.dart';

part 'document_view_event.dart';
part 'document_view_state.dart';

class DocViewBloc extends Bloc<DocViewEvent, DocViewState> {
  DocViewBloc() : super(DocViewState(DocView.carousel)) {
    on<DocViewEvent>((event, emit) => emit(DocViewState(event.docView)));
  }
}
