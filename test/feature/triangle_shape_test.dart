import 'package:flutter_test/flutter_test.dart';

void main() {
  //If one side is < 1, then it fails.
  detectTriangle(num sideA, num sideB, num sideC) {
    if (sideA < 1 || sideB < 1 || sideC < 1) {
      throw Exception();
    }
  }

  group('Detect the triangle', () {
    test('Should throw Error when there is side less than 1', () {
      expect(() => detectTriangle(-1, 2, 2), throwsA(isA<Exception>()));
    });
  });
}
