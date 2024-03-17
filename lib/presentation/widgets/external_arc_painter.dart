import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExternalArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    log('height ${size.height}');
    log('width ${size.width}');
    final rect = Rect.fromLTRB(
      0,
      0,
      size.width,
      size.height * 1.4,
    );
    const startAngle = -math.pi * 1.85;
    const sweepAngle = -math.pi * 1.30;
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
