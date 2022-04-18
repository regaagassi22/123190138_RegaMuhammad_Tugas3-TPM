/*
   Class helper berfungsi untuk melakukan proses ambil gambar melalui kamera atau
   gallery sehingga proses yang kita lakukan bisa dipisah antara class UI
 */

import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  final ImagePicker _picker = ImagePicker();

  void getImageFromGallery(Function(String?) callback) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      callback(pickedFile?.path);
    }catch(e){
      print("Image Picker Error");
    }
  }

  void getImageFromCamera(Function(String?) callback) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
      );
      callback(pickedFile?.path);
    }catch(e){
      print("Image Picker Error");
    }
  }
}