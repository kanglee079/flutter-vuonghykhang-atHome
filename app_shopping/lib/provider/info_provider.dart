import 'dart:async';
import 'dart:io';

import 'package:app_shopping/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InfoProvider extends ChangeNotifier {
  final ImagePicker picker = ImagePicker();
  double? uploadProgress;

  final StreamController<String> _imageUrlController =
      StreamController<String>.broadcast();

  Stream<String> get imageUrlStream => _imageUrlController.stream;

  void updateImageUrl(String? imageUrl) {
    _imageUrlController.add(imageUrl!);
  }

  void getImageUrlForUser() async {
    try {
      final Reference ref = FirebaseStorage.instance
          .ref()
          .child('images/${FirebaseAuth.instance.currentUser?.uid}.jpg');
      final String downloadURL = await ref.getDownloadURL();
      updateImageUrl(downloadURL);
    } catch (e) {
      if (e is FirebaseException && e.code == 'object-not-found') {
        final Reference defaultRef =
            FirebaseStorage.instance.ref().child('images/macdinh.jpg');
        final String defaultUrl = await defaultRef.getDownloadURL();
        updateImageUrl(defaultUrl);
      } else {
        print('Lỗi khi lấy URL của hình ảnh: $e');
        updateImageUrl(null);
      }
    }
  }

  void uploadAvatar() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final file = File(image.path);

      // Create the file metadata
      final metadata = SettableMetadata(contentType: "image/jpeg");

      // Create a reference to the Firebase Storage bucket
      final storageRef = FirebaseStorage.instance.ref();

      // Upload file and metadata to the path 'images/mountains.jpg'
      final uploadTask = storageRef
          .child("images/${FirebaseAuth.instance.currentUser?.uid}.jpg")
          .putFile(file, metadata);

      // Listen for state changes, errors, and completion of the upload.
      uploadTask.snapshotEvents.listen(
        (TaskSnapshot taskSnapshot) async {
          switch (taskSnapshot.state) {
            case TaskState.running:
              uploadProgress =
                  taskSnapshot.bytesTransferred / taskSnapshot.totalBytes;
              print("Upload is ${uploadProgress! * 100}% complete.");
              break;

            case TaskState.paused:
              print("Upload is paused.");
              break;
            case TaskState.canceled:
              print("Upload was canceled");
              break;
            case TaskState.error:
              // Handle unsuccessful uploads
              print("Error occurred during upload.");
              break;
            case TaskState.success:
              // getImageUrlForUser();
              final link = await taskSnapshot.ref.getDownloadURL();
              _imageUrlController.add(link);

              await FirebaseService.infoRef
                  .doc(FirebaseAuth.instance.currentUser?.uid)
                  .update({'photoUrl': link});

              break;
          }
        },
      );
    }
  }

  @override
  void dispose() {
    _imageUrlController.close();
    super.dispose();
  }
}
