import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/passState.dart';
class PassCubit extends Cubit<PassState> {
  PassCubit() : super(PassInit());
  void hide() {
    emit(PassUpdate(isHidden: !state.isHidden) );
  }
}
