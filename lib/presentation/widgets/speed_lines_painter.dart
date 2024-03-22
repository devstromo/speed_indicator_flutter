import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpeedLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const startAngle = -math.pi * 1.85;
    const sweepAngle = -math.pi * 1.30;
    final majorLinePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4;
    final middleLinePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;
    final fineLinePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    final radius = size.width * .4;
    final majorLineLength =
        size.width * 0.03; // Length for major increment lines
    final middleLineLength =
        majorLineLength * 0.75; // Length for middle increment lines
    final fineLineLength =
        majorLineLength * 0.5; // Length for minor increment lines

    final dxOffsetDelta = (size.width * .5);
    final dyOffsetDelta = (size.height * .68);

    // Draw major increment lines at every 20 units
    for (int i = 0; i <= 220; i += 20) {
      final angle = startAngle + (sweepAngle / 220) * i;
      final startOffset = Offset(
        (radius - majorLineLength) * math.cos(angle) + dxOffsetDelta,
        (radius - majorLineLength) * math.sin(angle) + dyOffsetDelta,
      );
      final endOffset = Offset(
        radius * math.cos(angle) + dxOffsetDelta,
        radius * math.sin(angle) + dyOffsetDelta,
      );

      canvas.drawLine(startOffset, endOffset, majorLinePaint);
    }

    // Draw middle increment lines (like 10, 30, etc.)
    for (int i = 10; i < 220; i += 20) {
      final angle = startAngle + (sweepAngle / 220) * i;
      final startOffset = Offset(
        (radius - middleLineLength) * math.cos(angle) + dxOffsetDelta,
        (radius - middleLineLength) * math.sin(angle) + dyOffsetDelta,
      );
      final endOffset = Offset(
        radius * math.cos(angle) + dxOffsetDelta,
        radius * math.sin(angle) + dyOffsetDelta,
      );

      canvas.drawLine(startOffset, endOffset, middleLinePaint);
    }

    // Draw fine increment lines (like 2, 4, 6, etc.)
    for (int i = 2; i < 220; i += 2) {
      // Skip drawing at major and middle points (multiples of 10)
      if (i % 10 == 0) continue;

      final angle = startAngle + (sweepAngle / 220) * i;
      final startOffset = Offset(
        (radius - fineLineLength) * math.cos(angle) + dxOffsetDelta,
        (radius - fineLineLength) * math.sin(angle) + dyOffsetDelta,
      );
      final endOffset = Offset(
        radius * math.cos(angle) + dxOffsetDelta,
        radius * math.sin(angle) + dyOffsetDelta,
      );

      canvas.drawLine(startOffset, endOffset, fineLinePaint);
    }
  }

  @override
  bool shouldRepaint(SpeedLinesPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SpeedLinesPainter oldDelegate) => false;
}
