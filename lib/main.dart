import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speed_indicator_flutter/presentation/screens/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ],
  ).then(
    (value) => runApp(
      const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpeedIndicator(),
    );
  }
}
