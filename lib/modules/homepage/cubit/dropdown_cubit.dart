import 'package:bloc/bloc.dart';

class DropdownCubit extends Cubit<String> {
  DropdownCubit() : super('Monthly');

  void changeValue(String newValue) => emit(newValue);
}
