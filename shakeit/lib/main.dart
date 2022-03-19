import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _state = true;

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        _state = !_state;
      });
      print(_state);  //for testing purposes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        Container(
          color: _state ? Color.fromARGB(255, 255, 251, 0) : Color.fromARGB(255, 34, 241, 7),
          height: 300,
          width: 500,
        ),
        Container(
          color: _state ? Color.fromARGB(255, 5, 253, 5) : Color.fromARGB(255, 251, 255, 3),
          height: 300,
          width: 500,
        ),
      ],
      ),
    ),
    );
  }
}