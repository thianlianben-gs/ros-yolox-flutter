import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ros_yolox_app/components/TextButtonComponent.dart';
import 'package:roslibdart/roslibdart.dart';

class DisplayPage extends StatefulWidget {
  final String ip_address;
  const DisplayPage({super.key,  required this.ip_address});

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
    ros = Ros(url: "ws://" + widget.ip_address + ':9090');
    chatter = Topic(
        ros: ros,
        name: '/image_publisher',
        type: "sensor_msgs/CompressedImage",
        reconnectOnClose: true,
        queueLength: 10,
        queueSize: 10);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    publisher_chatter = Topic(
        ros: ros,
        name: '/end_system',
        type: 'std_msgs/String',
        reconnectOnClose: true,
        queueLength: 10,
        queueSize: 10);
    super.initState();
    ros.connect();
    initConnection();
    // Timer(const Duration(seconds: 1), () async {
    //   await chatter.subscribe(subscribeHandler);
    //   // await chatter.subscribe();
    // });
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
                        child: Text("ROS + Flutter Object Detection"),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            // width: double.infinity,
                            padding: EdgeInsets.all(5.0),
                            child: StreamBuilder(
                              stream: imageStreamController.stream,
                              builder: ((context, snapshot) {
                                if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                }

                                if (!snapshot.hasData) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                if (snapshot.hasData) {
                                  final imageDataToShow =
                                      _latestImageData ?? snapshot.data;
                                  return Center(
                                      child: Image.memory(imageDataToShow!));
                                }
                                return Center(
                                  child: Text("Hello"),
                                );
                              }),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  TextButtonComponent(
                                      buttonText: "End",
                                      navigatePage: () async {
                                        Map<String, dynamic> end_json = {
                                          "data": "end_system"
                                        };
                                        await publisher_chatter
                                            .publish(end_json);
                                        print("publishing end system");
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
