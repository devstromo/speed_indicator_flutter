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
    // Paint for the lines
    final linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    // The radius might need to be adjusted depending on the size of your canvas
    final radius = size.width * .4;
    final lineLength = size.width * 0.1; // Adjust the length as needed
    final innerRadius =
        radius - lineLength; // This will be the start of the line

    int marker = 220;
    // Start drawing numbers from 0 to 220 at intervals of 20 km/h
    for (int i = 0; i <= 220; i += 20) {
      // Angle calculation for the numbers and lines
      final numberAngle = startAngle + (sweepAngle / 220) * i;

      final dxOffsetDelta = (size.width * .5);
      final dyOffsetDelta = (size.height * .68);
      // Calculating the position for the text
      final textOffset = Offset(
        radius * math.cos(numberAngle) + dxOffsetDelta,
        radius * math.sin(numberAngle) + dyOffsetDelta,
      );

      // Calculating the start and end points for the lines
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

      // Text painting setup
      final textSpan = TextSpan(
        text: '$marker',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      // Adjust text position to center it on the line
      final adjustedTextOffset = Offset(
        textOffset.dx - (textPainter.width * .5),
        textOffset.dy - (textPainter.height * .5),
      );

      // Draw the text on the canvas
      textPainter.paint(canvas, adjustedTextOffset);
      marker -= 20; // Decrease marker for next number
    }
  }

  @override
  bool shouldRepaint(SpeedNumbersPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SpeedNumbersPainter oldDelegate) => false;
}
