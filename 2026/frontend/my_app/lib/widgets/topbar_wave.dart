import 'package:flutter/material.dart';
import 'dart:math';

class WaveTopBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final Color color;

  const WaveTopBar({
    super.key,
    this.height = 120,
    this.color = Colors.blue,
  });

  @override
  State<WaveTopBar> createState() => _WaveTopBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _WaveTopBarState extends State<WaveTopBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // infinite loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(MediaQuery.of(context).size.width, widget.height),
          painter: _WavePainter(_controller.value, widget.color),
        );
      },
    );
  }
}

class _WavePainter extends CustomPainter {
  final double animationValue;
  final Color color;

  _WavePainter(this.animationValue, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    final waveHeight = 20.0;
    final waveLength = size.width / 1.5;

    path.moveTo(0, size.height * 0.5);

    for (double x = 0; x <= size.width; x++) {
      double y = sin((x / waveLength * 2 * pi) + (animationValue * 2 * pi)) *
              waveHeight +
          size.height * 0.5;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) => true;
}
