# Flutter + ROS2 + YOLOX

## Integrating ROS 2, YOLOX, and Flutter for Real-Time Object Detection and Communication

This project that involves communication between ROS 2 (Robot Operating System 2), YOLOX (a real-time object detection model), and a Flutter application to send image data is a complex and multi-step process. Below, I'll outline the general steps and components involved in such a project:

- Install and set up Integration of ROS2 and YOLOX. Here the doc is https://github.com/thianlianben-gs/ros2-yolox-python
- Set up a development environment for Flutter and develop application

I am going to set up environment for flutter requirements on Ubuntu 20.04. Follow every single step.

- Step 1 : Install flutter sdk in your machine
```bash
sudo snap install flutter --classic

# Once you install snap, use the following command to display your Flutter SDK path:
flutter sdk-path
# or flutter doctor -v

# you will see the flutter sdk path and note it. That will be required latter.
```

- Step 2 : Flutter relies on a full installation of Android Studio to supply its Android platform dependencies.
  
  - Here the link is https://vitux.com/how-to-install-android-studio-on-ubuntu/
 
- Step 3 : Clone the project and configure it in VSCode.

  ```bash
  git clone https://github.com/thianlianben-gs/ros-yolox-flutter.git
  ```

  - Open the project in VS code and Make installation Flutter in Extensions (VS code)
 
- Step 4 : Install Android SDK Command-line tools in SDK Manager menu

  - Launch it using the application launcher search bar and you will see Welcome Screen Page and There is one option which is **Open Exiting Project** and select the project that you clone it recently.
  - Go to Tools -> SDK Manager -> SDK Tools Tabs
  - Check Android SDK Command-Line tools (latest) and click apply.

- Step 5 : Build Android Emulator for testing application

  - Go to Tools -> Device Manager
  - You will see the devices you installed. If there is no any device , you can create one device.
  - Suppose you have already created one device and Click play icon.
  - Note: Don't close the emulator after running because we are going to run flutter project on it. After running, you can close it whatever you want. 
 
- Step 6 : Executing flutter project on emulator

  - Open terminal in VS code which is already opened the project file.
  - In terminal, run
    
    ```bash
    flutter doctor -v
    ```
  - You will see Connected devices.
  - Lets start execution.

    ```bash
    flutter run
    ```
    
