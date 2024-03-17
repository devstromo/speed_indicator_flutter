import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(
              size.width,
              size.height,
            ),
            painter: SpeedIndicatorPainter(),
          ),
          Padding(
            padding: const EdgeInsets.all(
              20,
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
              padding: const EdgeInsets.all(8.0),
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
    );
  }
}
