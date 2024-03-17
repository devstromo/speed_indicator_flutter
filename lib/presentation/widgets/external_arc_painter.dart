import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExternalArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(
      10,
      50,
      size.width - 10,
      size.width,
    );
    const startAngle = math.pi;
    const sweepAngle = math.pi;
    const useCenter = false;
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(ExternalArcPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ExternalArcPainter oldDelegate) => false;
}
