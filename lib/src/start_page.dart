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
  final TextEditingController ip_controller = TextEditingController();

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
  void dispose() {
    // TODO: implement dispose
    ip_controller.dispose();
    super.dispose();
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
              TextField(
                controller: ip_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'IP hostname of your machine',
                  hintText: 'Enter 000.000.00.0.0',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButtonComponent(
                  buttonText: "Start",
                  navigatePage: () {
                    if (ip_controller.text != "") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayPage(ip_address: ip_controller.text,)),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    ));
  }

  void navigateFunction() {}
}
