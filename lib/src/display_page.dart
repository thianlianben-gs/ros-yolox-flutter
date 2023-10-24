import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ros_yolox_app/components/TextButtonComponent.dart';
import 'package:roslibdart/roslibdart.dart';

class DisplayPage extends StatefulWidget {
  final String ipAddress;
  const DisplayPage({super.key, required this.ipAddress});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  late Ros ros;
  late Topic chatter;
  late Topic publisher_chatter;
  Uint8List? _latestImageData;

  StreamController<Uint8List> imageStreamController =
      StreamController<Uint8List>();

  @override
  void initState() {
    ros = Ros(url: "ws://${widget.ipAddress}:9090");
    chatter = Topic(
        ros: ros,
        name: '/image_publisher',
        type: "sensor_msgs/CompressedImage",
        reconnectOnClose: true,
        queueLength: 20,
        queueSize: 20);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    publisher_chatter = Topic(
        ros: ros,
        name: '/end_system',
        type: 'std_msgs/String',
        reconnectOnClose: true,
        queueLength: 20,
        queueSize: 20);
    super.initState();
    ros.connect();
    initConnection();
  }

  void initConnection() async {
    await chatter.subscribe(subscribeHandler);
  }

  void destroyConnection() async {
    await chatter.unsubscribe();
    await ros.close();
    imageStreamController.close();
  }

  dynamic msgReceived;
  Future<void> subscribeHandler(msg) async {
    _latestImageData = base64.decode(msg['data']);
    imageStreamController.add(base64.decode(msg['data']));
    setState(() {});
  }

  @override
  void dispose() {
    destroyConnection();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:
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
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: const Text("ROS + Flutter Object Detection"),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            // width: double.infinity,
                            padding: const EdgeInsets.all(5.0),
                            child: StreamBuilder(
                              stream: imageStreamController.stream,
                              builder: ((context, snapshot) {
                                if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                }

                                if (!snapshot.hasData) {
                                  print("Print : snapshot does not have data");
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                // if (snapshot.hasData) {
                                else {
                                  print("Print : snapshot  have data");
                                  final imageDataToShow =
                                      _latestImageData ?? snapshot.data;
                                  return Center(
                                      child: Image.memory(imageDataToShow!, gaplessPlayback: true,));
                                }
                                // return const Center(
                                //   child: Text("Hello"),
                                // );
                              }),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  TextButtonComponent(
                                      buttonText: "End",
                                      navigatePage: () async {
                                        Map<String, dynamic> endJson = {
                                          "data": "end_system"
                                        };
                                        await publisher_chatter
                                            .publish(endJson);

                                        print("Exit from flutter");
                                        developer.log(
                                            "Exit Program From Flutter app");
                                        Navigator.pop(context);
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
