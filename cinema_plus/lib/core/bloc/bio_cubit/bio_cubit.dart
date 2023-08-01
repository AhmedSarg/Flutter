import 'package:cinema_plus/core/bloc/bio_cubit/bio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BioCubit extends Cubit<BioState> {
  BioCubit() : super(BioHidden());
  bool fullBio = false;
  void switchBioState() {
    fullBio = !fullBio;
    if (fullBio) {
      emit(BioShown());
    } else {
      emit(BioHidden());
    }
  }
}
