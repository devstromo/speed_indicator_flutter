import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speed_indicator_flutter/config/config.dart';

final randomNumbersProvider = StateProvider.autoDispose<int>((ref) {
  return RandomGenerator.getRandomNumber();
});

final numbersStreamProvider = StreamProvider.autoDispose<int>((ref) async* {
  await for (final number in RandomGenerator.randomNumberStream()) {
    yield number;
  }
});