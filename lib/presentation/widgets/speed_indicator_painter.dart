import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpeedIndicatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
     // Original rectangle coordinates
    const rec = Rect.fromLTRB(0.0, 280.0, 300, 300);
    final paint = Paint()
      ..color = const Color(0xFF0099FF)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    // Draw the original rectangle
    canvas.drawRect(
      rec,
      paint,
    );

    // Rotate one side of the rectangle
    // Calculate the pivot point
    final pivotX = rec.left;
    final pivotY = rec.bottom;

    // Save the current canvas state
    canvas.save();

    // Move the canvas to the pivot point
    canvas.translate(pivotX, pivotY);

    // Rotate the canvas by the desired angle
    // Angle in radians, for example, 15 degrees: math.pi / 12
    canvas.rotate(math.pi / 12);

    // Move the canvas back
    canvas.translate(-pivotX, -pivotY);

    // Define a new rectangle to be rotated
    // This rectangle can have the same dimensions as the original or different, based on your needs
    // Here, it's slightly smaller and positioned differently for visibility
    const rotatedRec = Rect.fromLTRB(0.0, 260.0, 300, 280.0);

    // Draw the rotated rectangle
    canvas.drawRect(rotatedRec, paint);

    // Restore the canvas to its original state
    canvas.restore();
  }

  @override
  bool shouldRepaint(SpeedIndicatorPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SpeedIndicatorPainter oldDelegate) => false;
}
