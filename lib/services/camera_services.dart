part of 'services.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController controller;

  Future<void> initializeCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    await controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<File> takePicture() async {
    Directory root = await getTemporaryDirectory();
    String directoryPath = '${root.path}/Guided_camera';
    await Directory(directoryPath).create(recursive: true);
    String filePath = '$directoryPath/${DateTime.now()}.jpg';

    try {
      await controller.takePicture(filePath);
    } catch (e) {
      return null;
    }
    return File(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: initializeCamera(),
          builder: (_, snapshot) =>
              (snapshot.connectionState == ConnectionState.done)
                  ? Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width /
                              controller.value.aspectRatio,
                          child: CameraPreview(controller),
                        ),
                        Container(
                          child: RaisedButton(
                            child: Icon(
                              Icons.camera,
                            ),
                            onPressed: () async {
                              if (!controller.value.isTakingPicture) {
                                File result = await takePicture();
                                Navigator.pop(context, result);
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ))),
    );
  }
}
