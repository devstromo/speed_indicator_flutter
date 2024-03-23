import 'dart:math';

final _random = Random();
const min = 0;
const max = 220;

class RandomGenerator {
  static int getRandomNumber() {
    return min + _random.nextInt((max + 1) - min);
  }

  static Stream<int> randomNumberStream() {
    return Stream.periodic(
        const Duration(
          seconds: 2,
        ), (i) {
      return getRandomNumber();
    });
  }
}
