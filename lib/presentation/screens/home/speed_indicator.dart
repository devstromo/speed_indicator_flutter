import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:speed_indicator_flutter/presentation/widgets/widgets.dart';

class SpeedIndicator extends StatefulWidget {
  const SpeedIndicator({super.key});

  @override
  State<SpeedIndicator> createState() => _SpeedIndicatorState();
}

class _SpeedIndicatorState extends State<SpeedIndicator> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Calculate the rotation angle based on the slider value
    // final double angle = math.pi * _value / 200;

    final double angle = (11 * math.pi / 6) - (_value * (7 * math.pi / 6) / 220);
    log('Angle value: $angle');
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: size.height * .25,
              right: size.width * .5,
              bottom: kToolbarHeight,
              child: SpeedIndicatorNeedle(
                angle: -angle,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * .11,
                vertical: 2.0,
              ),
              child: CustomPaint(
                size: Size(
                  size.width,
                  size.height,
                ),
                painter: ExternalArcPainter(),
              ),
            ),
            Center(
              child: Text('Value ${_value.toInt()}'),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 20.0,
                ),
                child: Slider(
                  value: _value,
                  min: 0.0,
                  max: 200.0,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
