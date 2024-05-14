import 'package:bloc/bloc.dart';

part 'appbar_event.dart';
part 'appbar_state.dart';

class AppBarBloc extends Bloc<AppBarEvent, AppBarState> {
  AppBarBloc({bool isEditing = false}) : super(isEditing ? EditingState() : DoneState()) {
    on<FocusChangedEvent>((event, emit) {
      if (event.hasFocus) {
        emit(EditingState());
      } else {
        emit(DoneState());
      }
    });
  }
}
