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
  
  - Install Java JDK on Ubuntu 20.04
  ```bash
  sudo apt install openjdk-11-jdk
  ```
  - Add android-studio repository
  ```bash
  sudo add-apt-repository ppa:maarten-fonville/android-studio
  ```
  - Update the apt-cache
  ```bash
  sudo apt update
  ```
  - Install Android Studio
  ```bash
  sudo apt install android-studio
  ```
  - Launch Android Studio
    
    ![image](https://github.com/thianlianben-gs/ros-yolox-flutter/assets/142369449/bced3869-6c4a-43d2-bbf6-7bc0fab9b081)

  - Click on the android studio icon and configure the setting of the android studio on the Ubuntu 20.04 system. Select don’t import settings as follows:

    ![image](https://github.com/thianlianben-gs/ros-yolox-flutter/assets/142369449/4fd90508-6eea-4038-864b-71020a2edad6)

  - It will search for available SDK components on the following screen:

    ![image](https://github.com/thianlianben-gs/ros-yolox-flutter/assets/142369449/52a17e36-f337-48d0-906d-a268ed52f769)

  - Now, the Android setup wizard will start on your system. Click on Next as follows:

    ![image](https://github.com/thianlianben-gs/ros-yolox-flutter/assets/142369449/0ded9bb6-06b9-43bc-beef-08016b26e907)

  - Choose the install type Standard or Custom. Choose the Standard option and click on Next button as follows:

    ![image](https://github.com/thianlianben-gs/ros-yolox-flutter/assets/142369449/11721a57-f162-4b1b-b42d-33d970df16c7)

  - Now, you need to select the user interface theme. Choose Light and click on Next.
  - You can also choose another theme for the android studio as well. If you want to change any setting the click on the ‘Previous’ button. Otherwise, review the wizard setup settings and click on Next.
    
    ![image](https://github.com/thianlianben-gs/ros-yolox-flutter/assets/142369449/6e50621f-ab14-4de6-9a48-a6eb2163bdd2)

  - Now, formal emulator settings will display on the dialog window. The necessary components will begin to download on your system as follows. Click on the Finish button.

    ![image](https://github.com/thianlianben-gs/ros-yolox-flutter/assets/142369449/521d323c-c7ab-4502-b366-cb763c95d255)

  - Once the download is complete, now you will click on Finish. Now, the welcomeScreen window will display on your system from where you can use android studio on your system. Choose option Start a new android studio project to create a new application or Open existing project. 

    



