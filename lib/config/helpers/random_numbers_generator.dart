import 'dart:math';

final _random = Random();
const min = 0;
const max = 220;

class RandomGenerator {
  static int getRandomNumber() {
    return min + _random.nextInt((max + 1) - min);
  }
}
