import 'package:flutter/material.dart';

class Day01 extends StatefulWidget {
  const Day01({super.key});

  @override
  State<Day01> createState() => _Day01State();
}

class _Day01State extends State<Day01> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
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
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.5 / 2.0,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          Animation<double> animation = Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Interval((1 / 10) * index, 1),
            ),
          );
          
          _animationController.forward();

          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return FadeTransition(
                opacity: animation,
                child: Transform.translate(
                  offset: Offset(0, (1 - animation.value) * 50),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
