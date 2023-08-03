import 'package:cinema_plus/core/bloc/info_cubit/info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit() : super(InfoHidden());
  bool fullInfo = false;
  void switchInfoState() {
    fullInfo = !fullInfo;
    if (fullInfo) {
      emit(InfoShown());
    } else {
      emit(InfoHidden());
    }
  }
}
