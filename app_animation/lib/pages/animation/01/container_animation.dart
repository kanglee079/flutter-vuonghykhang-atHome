import 'package:flutter/material.dart';

class ContainerAnimation extends StatefulWidget {
  const ContainerAnimation({super.key});

  @override
  State<ContainerAnimation> createState() => _ContainerAnimationState();
}

class _ContainerAnimationState extends State<ContainerAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation =
        Tween<double>(begin: 0, end: 200).animate(_animationController);
    _animationController.forward();
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
        child: ScaleTransition(
          scale: _animation,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
      // Dùng animatedBuilder
      // child: AnimatedBuilder(
      //   animation: _animation,
      //   builder: (context, child) {
      //     print(_animation.value);
      //     return Container(
      //       width: _animation.value,
      //       height: _animation.value,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(12),
      //         color: Colors.blueAccent,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
