import 'package:api_test/core/bloc/data_cubit/data_state.dart';
import 'package:api_test/core/services/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(this.userService) : super(DataLoading());
  UserService userService;
  void findPassforEmail(
      {required String email, required String password}) async {
    emit(DataLoading());
    try {
      await userService.findPassforEmail(email: email, password: password);
      emit(DataSuccess());
    } on Exception catch (e) {
      emit(DataFailure());
    }
  }
}
