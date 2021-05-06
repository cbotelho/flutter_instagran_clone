import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

/* 카메라 Take 과정
1. available camera 가져오기.
2. 카메라 리스트 에서 첫번째 카메라 사용.
3. CameraController 인스턴스 사용
4. CameraController.initialize().
5. show preview
6. set ready to take photo
*/
class CameraState extends ChangeNotifier {
  CameraController _controller;
  CameraDescription _cameraDescription;
  bool _readyTakePhoto = false;

  void getReadyToTakePhoto() async {
    List<CameraDescription> cameras = await availableCameras(); //1

    if (cameras != null && cameras.isNotEmpty) {
      setcameraDescription(cameras[0]); //2
    }

    //? initialize()함수안에서 return true가 안나오면(즉 중간에 에러떠서 false를 반환하는 동안)
    //? 계속 while문 안에 갇혀서 될때가지 initialize()를 실행하는 것.
    bool init = false;
    while (!init) {
      init = await initialize();
    }
    await _controller.initialize(); //4

    _readyTakePhoto = true;
    notifyListeners();
  }

  //3
  void setcameraDescription(CameraDescription cameraDescription) {
    _cameraDescription = cameraDescription;
    _controller = CameraController(_cameraDescription, ResolutionPreset.medium);
  }

  Future<bool> initialize() async {
    try {
      await _controller.initialize();
      return true;
    } catch (e) {
      return false;
    }
  }

  CameraController get controller => _controller;
  CameraDescription get description => _cameraDescription;
  bool get isReadyToTakePhoto => _readyTakePhoto;
}
