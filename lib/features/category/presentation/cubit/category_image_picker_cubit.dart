import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

class CategoryImagePickerCubit extends Cubit<String> {
  CategoryImagePickerCubit() : super('');

  final ImagePicker _picker = ImagePicker();

  bool isPicked = false;
  String imagePath = '';
  // Pick an image
  void pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      isPicked = true;
      imagePath = image.path;
      emit(image.path);
    }
  }

  void deleteImage() {
    imagePath = '';
    isPicked = false;
    emit(imagePath);
  }

  String getPath() {
    // emit(CheckIsImagePicked(isPicked: isPicked));
    return imagePath;
  }
}
