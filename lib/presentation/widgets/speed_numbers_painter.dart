import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpeedNumbersPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const startAngle = -math.pi * 1.85;
    const sweepAngle = -math.pi * 1.30;
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    final linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    final radius = size.width * .4;
    final lineLength = size.width * 0.03; // Adjust the length as needed
    final innerRadius =
        radius - lineLength; // This will be the start of the line

    final dxOffsetDelta = (size.width * .5);
    final dyOffsetDelta = (size.height * .68);
    int marker = 220;

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

      final textSpan = TextSpan(
        text: '$marker',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      // Calculate the position for the number, it should be on the outside of the line end
      final numberOffset = Offset(
        (innerRadius + lineLength + 20) * math.cos(numberAngle) +
            dxOffsetDelta -
            textPainter.width * .5,
        (innerRadius + lineLength + 20) * math.sin(numberAngle) +
            dyOffsetDelta -
            textPainter.height * .5,
      );

      // Draw the text on the canvas, ensuring it's on top of the line
      textPainter.paint(canvas, numberOffset);
      marker -= 20; // Decrease marker for next number
    }
  }

  @override
  bool shouldRepaint(SpeedNumbersPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SpeedNumbersPainter oldDelegate) => false;
}
