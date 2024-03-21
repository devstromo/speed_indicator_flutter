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

    final radius = size.width * .4;
    final lineLength = size.width * 0.03; // Adjust the length as needed
    final innerRadius =
        radius - lineLength; // This will be the start of the line

    final dxOffsetDelta = (size.width * .5);
    final dyOffsetDelta = (size.height * .68);

    // Draw lines and numbers together in one loop
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

      // Draw the line on the canvas
      canvas.drawLine(lineStartOffset, lineEndOffset, linePaint);
    }
  }

  @override
  bool shouldRepaint(SpeedLinesPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SpeedLinesPainter oldDelegate) => false;
}
