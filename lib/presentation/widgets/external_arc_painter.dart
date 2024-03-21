import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExternalArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
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
    // Text painting code starts here
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    // The radius might need to be adjusted depending on the size of your canvas
    final radius = size.width * .4;

    int marker = 220;
    // Start drawing numbers from 0 to 220 at intervals of 20 km/h
    for (int i = 0; i <= 220; i += 20) {
      // Angle calculation for the numbers must be adjusted to match your arc
      // This assumes the numbers are spread over the same angle as the arc itself
      final numberAngle = startAngle + (sweepAngle / 220) * i;

      // Calculating the position for the text
      final offset = Offset(
        radius * math.cos(numberAngle) + (size.width * .5),
        radius * math.sin(numberAngle) + (size.height * .68),
      );

      // Offset adjustment might be necessary to properly position the numbers
      final textSpan = TextSpan(
        text: '$marker',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      final textOffset = Offset(
        offset.dx - (textPainter.width * .5),
        offset.dy - (textPainter.height * .5),
      );

      // Draw the text on the canvas
      textPainter.paint(canvas, textOffset);
      marker -= 20;
    }
  }

  @override
  bool shouldRepaint(ExternalArcPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ExternalArcPainter oldDelegate) => false;
}
