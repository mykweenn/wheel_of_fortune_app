import 'package:flutter/material.dart';
import 'package:wheel_of_fortune_app/presentation/widgets/wheel.dart';

void main() {
  runApp(const FortuneWheelApp());
}

class FortuneWheelApp extends StatelessWidget {
  const FortuneWheelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.greenAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: const Wheel(),
                ),
                ElevatedButton(
                  onPressed: () {
                    final wheelState = context.findAncestorStateOfType<WheelState>();
                    wheelState?.spinWheel();
                  }, 
                  child: const Text("Play again"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}