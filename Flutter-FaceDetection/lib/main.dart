import 'package:firebase_livestream_ml_vision/firebase_livestream_ml_vision.dart';
import 'package:flutter/material.dart';
import 'detector_painters.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseVision _vision;
  dynamic _scanResults;
  Detector _currentDetector = Detector.face;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    List<FirebaseCameraDescription> cameras = await camerasAvailable();
    _vision = FirebaseVision(cameras[0], ResolutionSetting.high);
    _vision.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  Widget _buildResults() {
    const Text noResultsText = Text('No results!');

    CustomPainter painter;

    final Size imageSize = Size(
      _vision.value.previewSize.height,
      _vision.value.previewSize.width,
    );

    switch (_currentDetector) {
      case Detector.face:
        _vision.addFaceDetector().then((onValue){
          onValue.listen((onData){
            setState(() {
              _scanResults = onData;
            });
          });
        });
        if (_scanResults is! List<Face>) return noResultsText;
        painter = FaceDetectorPainter(imageSize, _scanResults);
        break;
      default:
        assert(_currentDetector == Detector.face);
        _vision.addFaceDetector().then((onValue){
          onValue.listen((onData){
            setState(() {
              _scanResults = onData;
            });
          });
        });
    }

    return CustomPaint(
      painter: painter,
    );
  }

  Widget _buildImage() {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: _vision == null
          ? const Center(
        child: Text(
          'Initializing Camera...',
          style: TextStyle(
            color: Colors.green,
            fontSize: 30.0,
          ),
        ),
      )
          : Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FirebaseCameraPreview(_vision),
          _buildResults(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ML Vision Example'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (result) {
              _currentDetector = result;
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: Text('Detect Face'),
                value: Detector.face,
              ),
            ],
          ),
        ],
      ),
      body: _buildImage(),
    );
  }

  @override
  void dispose() {
    _vision.dispose().then((_) {
      _vision.faceDetector.close();
    });

    _currentDetector = null;
    super.dispose();
  }

}