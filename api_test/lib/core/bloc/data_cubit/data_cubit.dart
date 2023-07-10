import 'package:api_test/core/bloc/data_cubit/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataLoading());
}
