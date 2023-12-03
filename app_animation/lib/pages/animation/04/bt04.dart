import 'package:flutter/material.dart';

class BT04 extends StatefulWidget {
  const BT04({super.key});

  @override
  State<BT04> createState() => _BT04State();
}

class _BT04State extends State<BT04> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              if (_animationController.value == 0.0) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
            },
            child: AnimatedIcon(
                icon: AnimatedIcons.pause_play, progress: _animation)),
      ),
    );
  }
}
