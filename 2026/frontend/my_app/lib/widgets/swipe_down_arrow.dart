import 'package:flutter/material.dart';
class SwipeDownArrow extends StatefulWidget {
  const SwipeDownArrow({super.key});

  @override
  _SwipeDownArrowState createState() => _SwipeDownArrowState();
}

class _SwipeDownArrowState extends State<SwipeDownArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Icon(
            Icons.arrow_downward,
            size: 36,
            color: Theme.of(context).primaryColor,
          ),
        );
      },
    );
  }
}
