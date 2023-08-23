import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ros_yolox_app/components/TextButtonComponent.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        child: Text("ROS + Flutter Object Detection"),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                              // width: double.infinity,
                              padding: EdgeInsets.all(5.0),
                              child: Image(
                                image: AssetImage("assets/placeholder.png"),
                              )),
                          Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  TextButtonComponent(
                                      buttonText: "End",
                                      navigatePage: () {
                                        print("End......");
                                      })
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
