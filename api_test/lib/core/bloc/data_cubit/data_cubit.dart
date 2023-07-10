import 'package:api_test/core/bloc/data_cubit/data_state.dart';
import 'package:api_test/core/services/user_service.dart';
import 'package:api_test/features/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(this.userService) : super(DataInitial());
  UserService userService;
  late UserModel loggedUser;
  void findPassforEmail(
      {required String email, required String password}) async {
    emit(DataLoading());
    try {
      loggedUser =
          await userService.findPassforEmail(email: email, password: password);
      emit(DataSuccess());
    } catch (e) {
      emit(DataFailure());
    }
  }
}
