import 'package:camera/camera.dart';

class CameraService {
  late CameraController controller;
  late List<CameraDescription> cameras;

  Future<void> initializeCameras() async {
    cameras = await availableCameras();
  }

  Future<void> initializeCameraController() async {
    if (cameras.isEmpty) {
      throw Exception('Aucune caméra disponible');
    }

    controller = CameraController(
      cameras.first,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    await controller.initialize();
  }

  Future<XFile?> takePicture() async {
    try {
      if (!controller.value.isInitialized) {
        return null;
      }
      return await controller.takePicture();
    } catch (e) {
      return null;
    }
  }

  Future<void> dispose() async {
    await controller.dispose();
  }
}
