import 'dart:math';

import 'package:flutter/material.dart';

class BT03 extends StatefulWidget {
  const BT03({super.key});

  @override
  State<BT03> createState() => _BT03State();
}

class _BT03State extends State<BT03> with TickerProviderStateMixin {
  late AnimationController _animationController, _animationControllerRotate;
  late Animation<double> _animation, _animationRote;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _animationControllerRotate = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animationRote =
        Tween<double>(begin: 0, end: 2 * pi).animate(_animationControllerRotate)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationControllerRotate.reset();
            }
          });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerRotate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedBuilder(
              animation: Listenable.merge(
                [
                  _animation,
                  _animationRote,
                ],
              ),
              builder: (context, child) {
                return FadeTransition(
                  opacity: _animation,
                  child: Transform.translate(
                    offset: Offset(_animation.value * 200, 0),
                    child: Transform.rotate(
                      angle: _animationRote.value,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(color: Colors.amber),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _animationController.forward();
                  },
                  child: const Text("show"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _animationController.reverse();
                  },
                  child: const Text("Trở lại"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _animationControllerRotate.forward();
                  },
                  child: const Text("xoay 1 lần"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _animationControllerRotate.repeat();
                  },
                  child: const Text("Luôn xoay"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
