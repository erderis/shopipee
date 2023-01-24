import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portfolio/core/error/exception.dart';

abstract class CategoryImageRemote {
  Future<String> uploadImage({required String filePath});
}

class CategoryImageRemoteImpl implements CategoryImageRemote {
  final FirebaseStorage storage;

  CategoryImageRemoteImpl({required this.storage});

  @override
  Future<String> uploadImage({required String filePath}) async {
    try {
      Uint8List imageData = await XFile(filePath).readAsBytes();
      final storageRef = storage.ref();
      final storageReference =
          storageRef.child("category/${filePath.split('/').last}.jpg");
      UploadTask uploadTask = storageReference.putData(imageData);
      final res = await uploadTask;
      return res.ref.getDownloadURL();
    } catch (_) {
      throw ServerException();
    }
  }
}
