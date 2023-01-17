import 'package:bloc/bloc.dart';

class SwitcherCubit extends Cubit<bool> {
  SwitcherCubit() : super(false);

  void dark() => emit(true);
  void light() => emit(false);
}
