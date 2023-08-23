import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ros_yolox_app/components/TextButtonComponent.dart';
import 'package:ros_yolox_app/src/display_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    //set initial Orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OrientationBuilder(
      builder: (context, orientation) => SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "ROS + Flutter Object Detection App",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButtonComponent(
                  buttonText: "Start",
                  navigatePage: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DisplayPage()),
                    );
                  })
            ],
          ),
        ),
      ),
    ));
  }

  void navigateFunction() {}
}
