import 'package:flutter/material.dart';

class SpeedIndicatorNeedle extends StatelessWidget {
  const SpeedIndicatorNeedle({
    super.key,
    required this.angle,
  });
  final double angle;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      alignment: Alignment.centerRight,
      child: Container(
        width: 250,
        height: 10,
        decoration: BoxDecoration(
          color: const Color(0xFFc603fc).withOpacity(
            .5,
          ),
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
      ),
    );
  }
}
