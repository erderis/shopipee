import 'package:bloc/bloc.dart';

class ImageValidatorCubit extends Cubit<bool> {
  ImageValidatorCubit() : super(false);

  void showErrorImage(String imagePath) {
    if (imagePath.isEmpty)
      emit(true);
    else
      emit(false);
  }
}
