import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpeedIndicatorPainter extends CustomPainter {
  final double angle;

  SpeedIndicatorPainter({this.angle = 0.0});
  @override
  void paint(Canvas canvas, Size size) {
    // Rotation will be applied to the entire canvas
    canvas.save();
    // Rotating around the center of the canvas
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(angle);
    canvas.translate(-size.width / 2, -size.height / 2);

    // Now draw your elements, they will be rotated according to the angle
    const rec = Rect.fromLTRB(0.0, 280.0, 300, 300);
    final paint = Paint()
      ..color = const Color(0xFF0099FF)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;
    canvas.drawRect(rec, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(SpeedIndicatorPainter oldDelegate) =>
      angle != oldDelegate.angle;

  @override
  bool shouldRebuildSemantics(SpeedIndicatorPainter oldDelegate) => false;
}
