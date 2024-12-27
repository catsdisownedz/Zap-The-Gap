import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class ImageProcessingService {
  final ImagePicker _picker = ImagePicker();

  /// Picks an image from the camera.
  Future<File?> pickImageFromCamera() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    } catch (e) {
      print('Error picking image from camera: $e');
    }
    return null;
  }

  /// Picks an image from the gallery.
  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
    }
    return null;
  }

  /// Loads the TFLite model for schedule extraction.
  Future<void> loadModel() async {
    try {
      String? result = await Tflite.loadModel(
        model: "assets/model/schedule_model.tflite",
        labels: "assets/model/labels.txt",
      );
      print('Model loaded: $result');
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  /// Processes the image and extracts the schedule.
  Future<List?> processImage(File image) async {
    try {
      List<dynamic>? recognitions = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 127.5,
        imageStd: 127.5,
        numResults: 10,
        threshold: 0.5,
        asynch: true,
      );

      if (recognitions != null) {
        List extractedSchedules = recognitions.map((rec) {
          return rec['label']; // Assuming labels represent schedule items
        }).toList();
        return extractedSchedules;
      }
    } catch (e) {
      print('Error processing image: $e');
    }
    return null;
  }

  /// Unloads the TFLite model when it's no longer needed.
  Future<void> unloadModel() async {
    try {
      await Tflite.close();
    } catch (e) {
      print('Error unloading model: $e');
    }
  }
}
