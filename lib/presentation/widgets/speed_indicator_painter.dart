import 'package:flutter/material.dart';

class SpeedIndicatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const rec = Rect.fromLTRB(0.0, 0.0, 300, 300);
    final paint = Paint()
      ..color = const Color(0xFF0099FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRect(
      rec,
      paint,
    );
  }

  @override
  bool shouldRepaint(SpeedIndicatorPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SpeedIndicatorPainter oldDelegate) => false;
}
