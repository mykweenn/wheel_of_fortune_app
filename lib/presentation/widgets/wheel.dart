import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Wheel extends StatefulWidget {
  const Wheel({super.key});

  @override
  State<Wheel> createState() => WheelState();
}

class WheelState extends State<Wheel> with SingleTickerProviderStateMixin {
  StreamController<int> controller = StreamController<int>();
  int? outcome;
  late AnimationController animationController;
  
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    controller.close();
    super.dispose();
  }

  void spinWheel() {
    List<int> outcomes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    
    setState(() {
      outcome = outcomes[Random().nextInt(outcomes.length)];
      animationController.reset();
      animationController.forward();
    });

    // Добавляем небольшую задержку перед показом результата
    Future.delayed(const Duration(milliseconds: 1500), () {
      controller.add(outcome ?? 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(animationController),
      child: FortuneWheel(
        selected: controller.stream,
        animateFirst: false,
        items: [
          FortuneItem(child: Text('Han Solo')),
          FortuneItem(child: Text('Yoda')),
          FortuneItem(child: Text('Obi-Wan Kenobi')),
        ],
        // onFling: spinWheel,
      ),
    );
  }
}