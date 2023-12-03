import 'package:flutter/material.dart';

class BT02 extends StatefulWidget {
  const BT02({super.key});

  @override
  State<BT02> createState() => _BT02State();
}

class _BT02State extends State<BT02> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _animation,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(color: Colors.amber),
              ),
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
                  child: const Text("Hidden"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _animationController.repeat(reverse: true);
                  },
                  child: const Text("Loading"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
