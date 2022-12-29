import 'package:flutter/material.dart';

/// A placeholder class that represents an entity or model.
class Project {
  final String name;
  final String description1;
  final String description2;
  final MaterialColor color;
  List<String> img;

  Project(
    @required this.name,
    @required this.description1,
    @required this.description2,
    @required this.color,
    @required this.img,
  );
}

Project underwaterSensorSystem = Project(
  "Underwater Sensor System for Depth Control",
  'The Underwater Sensor System (USS) is a subsystem designed to measure pressure and temperature data in an underwater environment. It is used in a system that deploys and retrieves a payload (e.g., an instrument) from the water.\n\nThe USS is responsible for continuously monitoring pressure and temperature in order to provide information about the depth of the winch cable. This information is used to accurately control the position of the winch drum, which is used to deploy and retrieve the payload. The USS may also be equipped with sensors to measure other parameters, such as pH, dissolved oxygen, and conductivity.\n\nThe USS is designed to be low-power and durable, in order to withstand the harsh underwater environment and operate for long periods of time without requiring maintenance. It has the ability to communicate with external instruments that are attached to it, such as a plankton net.\n\n',
  '\n\nHardware:\nMSP430FR2475TPT | Microcontroller\nMS5837-30BA | Pressure sensor\nTSYS01 | Temperature sensor\nMAX3471CUA+ | RS485\nLP2980IM5-3.0 | Power regulator 3V\nLT1935ES5#TRPBF | Power regulator 12V\nICL3221ECVZ-T | RS232\n',
  Colors.red,
  [
    './assets/images/USS_sideview.jpg',
    './assets/images/USS_sideCAD.png',
    './assets/images/USS_split.png',
    './assets/images/Electronics.png'
  ],
);

Project fishRobot = Project(
  "Autonomous Robotic Fish for Underwater Research",
  'A 3D printed waterproof robotic fish developed to customer requirements. Using embedded C for the control system on an ESP32 to control 3 servos to create a fish like motion. Powered by 2 LIPO’s on board with a current reader module. Components are connected using I2C and the ESP32 is OTA programmable (2.4GHz WIFI). First fish robot in the world with active head control. The research done with this robotic fish will be submitted to the Bioinspired & Biomimetic journal.\n\n',
  "",
  Colors.amber,
  [
    './assets/images/FishCAD.png',
    './assets/images/FishReal.jpg',
    './assets/images/FishElectronics.jpg',
    './assets/images/FishElectronicsCAD.png',
    './assets/images/FishFrontView.PNG',
    './assets/videoes/FishDemo.mp4'
  ],
);

Project lunarRover = Project(
  "Lunar Rover for Crater Exploration",
  'A 3D printed rover with 3 wheels. Two of the tree wheels are motorized with DC motors and the arms with stepper motors. An Arduino is controlling the arms and wheels using the encoders on the motors. Powered by 2 LIPO’s.',
  "Text2",
  Colors.blue,
  ['./assets/images/Rover.png'],
);

Project mazeBuggy = Project(
  "Autonomous Mazesolving Robot",
  "Used “The Formula AllCode Robot Buggy” to automatically explore a 10x10 maze. Used onboard IR sensors and LDR for wall detection and mapping. Created a real time system using a state machine and a PID controller. Programmed the onboard dsPIC microcontroller using embedded C. Dynamically updated the map on the LCD as the robot explored the maze. Created app to also drive it manually over Bluetooth.",
  "",
  Colors.green,
  ['./assets/images/Buggy.jpg'],
);
