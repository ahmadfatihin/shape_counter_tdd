import 'package:flutter_test/flutter_test.dart';

void main() {
  //If one side is < 1, then it fails.
  detectTriangle(num sideA, num sideB, num sideC) {
    final sides = [sideA, sideB, sideC];

    for (var side in sides) {
      if (side < 1) {
        throw Exception();
      }
    }

    //Check equilateral triangle
    if (sideA == sideB && sideA == sideC && sideB == sideC) {
      return "This is equilateral triangle";
    }
    if (sides[0] == sides[1]) {
      return "isosceles triangle";
    }
  }

  group('Detect the triangle', () {
    test('Should throw Error when there is side less than 1', () {
      expect(() => detectTriangle(-1, 2, 2), throwsA(isA<Exception>()));
    });

    test('Should return "equilateral triangle" when all sides are equal', () {
      expect(detectTriangle(1, 1, 1), "equilateral triangle");
      expect(detectTriangle(1, 1, 2), isNot("equilateral triangle"));
    });

    test('Should return "isosceles triangle" when only two sides are equal',
        () {
      expect(detectTriangle(1, 1, 2), "isosceles triangle");
    });
  });
}
