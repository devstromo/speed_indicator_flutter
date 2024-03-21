import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpeedLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const startAngle = -math.pi * 1.85;
    const sweepAngle = -math.pi * 1.30;
    final linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    final boldLinePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4; // Make the mid-value lines bolder

    final radius = size.width * .4;
    final lineLength = size.width * 0.03; // Length for major increment lines
    final shortLineLength = lineLength * 0.6; // Shorter length for mid-value lines
    final innerRadius = radius - lineLength; // Start of the major increment lines
    final innerShortRadius = radius - shortLineLength; // Start of the mid-value lines

    final dxOffsetDelta = (size.width * .5);
    final dyOffsetDelta = (size.height * .68);

    // Draw major increment lines at every 20 units
    for (int i = 0; i <= 220; i += 20) {
      final numberAngle = startAngle + (sweepAngle / 220) * i;

      final lineStartOffset = Offset(
        innerRadius * math.cos(numberAngle) + dxOffsetDelta,
        innerRadius * math.sin(numberAngle) + dyOffsetDelta,
      );
      final lineEndOffset = Offset(
        (innerRadius + lineLength) * math.cos(numberAngle) + dxOffsetDelta,
        (innerRadius + lineLength) * math.sin(numberAngle) + dyOffsetDelta,
      );

      canvas.drawLine(lineStartOffset, lineEndOffset, linePaint);
    }

    // Draw shorter, bolder lines at every mid-value between the major increments
    for (int i = 10; i < 220; i += 20) { // Starting from 10 and not including 220
      final midValueAngle = startAngle + (sweepAngle / 220) * i;

      final shortLineStartOffset = Offset(
        innerShortRadius * math.cos(midValueAngle) + dxOffsetDelta,
        innerShortRadius * math.sin(midValueAngle) + dyOffsetDelta,
      );
      final shortLineEndOffset = Offset(
        (innerShortRadius + shortLineLength) * math.cos(midValueAngle) + dxOffsetDelta,
        (innerShortRadius + shortLineLength) * math.sin(midValueAngle) + dyOffsetDelta,
      );

      canvas.drawLine(shortLineStartOffset, shortLineEndOffset, boldLinePaint);
    }
  }

  @override
  bool shouldRepaint(SpeedLinesPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SpeedLinesPainter oldDelegate) => false;
}
