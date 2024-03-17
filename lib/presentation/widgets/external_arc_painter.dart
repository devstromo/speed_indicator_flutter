import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExternalArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    log('height ${size.height}');
    log('width ${size.width}');
    final rect = Rect.fromLTRB(
      10,
      50,
      size.width - 10,
      size.width * .75,
    );
    const startAngle = -math.pi * 1.83;
    const sweepAngle = -math.pi * 1.35;
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
