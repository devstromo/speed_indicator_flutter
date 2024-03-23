import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speed_indicator_flutter/presentation/provider/numbers_generator_provider.dart';
import 'package:speed_indicator_flutter/presentation/widgets/speed_lines_painter.dart';
import 'package:speed_indicator_flutter/presentation/widgets/speed_numbers_painter.dart';
import 'dart:math' as math;
import 'package:speed_indicator_flutter/presentation/widgets/widgets.dart';

class SpeedIndicator extends ConsumerWidget {
  SpeedIndicator({super.key});
  var _value = 220.0;
  final midValue = 110.0;
  final minFactor = 0.40;
  final maxFactor = 0.45;

  double _calculateLeftFactor(double value) {
    if (value <= midValue) {
      // Calculate factor for values from 0 to 110
      double slope = (maxFactor - minFactor) / midValue;
      return minFactor + slope * value;
    } else {
      // Calculate factor for values from 110 to 220
      double slope = (minFactor - maxFactor) / (220 - midValue);
      return maxFactor + slope * (value - midValue);
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    final double angle = (math.pi * 2.17) - (_value * (math.pi * 1.34) / 220);
    final double leftFactor = _calculateLeftFactor(_value);
    const verticalPadding = 2.0;
    final randomNames$ = ref.watch(numbersStreamProvider);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: size.height * leftFactor, // needle size .40 in borders
              right: size.width * .5,
              bottom: kToolbarHeight + 60,
              child: SpeedIndicatorNeedle(
                angle: -angle,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * .15,
                vertical: verticalPadding,
              ),
              child: CustomPaint(
                size: Size(
                  size.width,
                  size.height,
                ),
                painter: SpeedLinesPainter(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * .15,
                vertical: verticalPadding,
              ),
              child: CustomPaint(
                size: Size(
                  size.width,
                  size.height,
                ),
                painter: SpeedNumbersPainter(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * .210,
                vertical: 23.0,
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
          ],
        ),
      ),
    );
  }
}
