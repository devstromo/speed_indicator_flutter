import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speed_indicator_flutter/presentation/provider/numbers_generator_provider.dart';
import 'package:speed_indicator_flutter/presentation/widgets/speed_lines_painter.dart';
import 'package:speed_indicator_flutter/presentation/widgets/speed_numbers_painter.dart';
import 'dart:math' as math;
import 'package:speed_indicator_flutter/presentation/widgets/widgets.dart';

class SpeedIndicator extends ConsumerStatefulWidget {
  const SpeedIndicator({super.key});

  @override
  SpeedIndicatorState createState() => SpeedIndicatorState();
}

class SpeedIndicatorState extends ConsumerState<SpeedIndicator> {
  final midValue = 110.0;
  final minFactor = 0.40;
  final maxFactor = 0.45;

  double _calculateLeftFactor(int value) {
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

  double _calculateAngle(int value) {
    log('Value $value');
    return (math.pi * 2.17) - (value * (math.pi * 1.34) / 220);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const verticalPadding = 2.0;
    final randomNames$ = ref.watch(numbersStreamProvider);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            randomNames$.when(
              data: (data) => TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 500),
                tween: Tween<double>(begin: _calculateLeftFactor(data), end: _calculateLeftFactor(data)),
                builder: (context, leftFactor, child) {
                  return Positioned(
                    left: size.height * leftFactor,
                    right: size.width * .5,
                    bottom: kToolbarHeight + 60,
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 500),
                      tween: Tween<double>(begin: -_calculateAngle(data), end: -_calculateAngle(data)),
                      builder: (context, angle, child) {
                        return SpeedIndicatorNeedle(
                          angle: angle,
                        );
                      },
                    ),
                  );
                },
              ),
              error: (error, stackTrace) => Text('Error $error'),
              loading: () => const Center(child: CircularProgressIndicator()),
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
          ],
        ),
      ),
    );
  }
}
