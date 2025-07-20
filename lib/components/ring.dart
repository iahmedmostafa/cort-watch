import 'dart:math';

import 'package:flutter/material.dart';
class GlowingRing extends StatefulWidget {
  @override
  _GlowingRingState createState() => _GlowingRingState();
}

class _GlowingRingState extends State<GlowingRing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final double targetPercentage = 0.36;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 2 + targetPercentage,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });


    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Glowing Ring
        CustomPaint(
          painter: GlowingRingPainter(_animation.value),
          size: Size(200, 200),
        ),
        // Center Content
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${(targetPercentage * 100).toInt()}%", // Display percentage
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Active",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class GlowingRingPainter extends CustomPainter {
  final double progress;

  GlowingRingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);

    // Background glow effect
    Paint glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.deepOrange.withOpacity(0.1),
          Colors.deepOrange.withOpacity(0.7),
          Colors.deepOrange.withOpacity(0.1),
        ],
        stops: [0.5, 0.8, 1],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, glowPaint);

    // Outer ring with dynamic effect
    Paint ringPaint = Paint()
      ..color = Colors.deepOrange
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..shader = SweepGradient(
        colors: [Colors.deepOrange, Colors.transparent],
        stops: [progress % 1, progress % 1 + 0.1],
        transform: GradientRotation(2 * pi * (progress % 1)),
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, ringPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}