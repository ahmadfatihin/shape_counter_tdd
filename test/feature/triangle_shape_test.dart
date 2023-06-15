import 'package:flutter_test/flutter_test.dart';

void main() {
  //If one side is < 1, then it fails.
  detectTriangle(num sideA, num sideB, num sideC) {
    final sides = [sideA, sideB, sideC];
    sides.sort();

    for (var side in sides) {
      if (side < 1) {
        throw Exception();
      }
    }

    //Triangle Inequality theorem
    if (sides[0] + sides[1] <= sides[2]) {
      throw Exception('Inequal Triangle');
    }

    //Check triangle types
    if (sides[0] == sides[1] && sides[0] == sides[2]) {
      return "equilateral triangle";
    }
    if (sides[0] == sides[1] || sides[1] == sides[2]) {
      return "isosceles triangle";
    }

    return "scalene triangle";
  }

  group('Detect the triangle', () {
    test('Should throw Error when there is side less than 1', () {
      expect(() => detectTriangle(-1, 2, 2), throwsA(isA<Exception>()));
    });

    test('Should return "equilateral triangle" when all sides are equal', () {
      expect(detectTriangle(1, 1, 1), "equilateral triangle");
      expect(detectTriangle(2, 2, 1), isNot("equilateral triangle"));
    });

    test('Should return "isosceles triangle" when only two sides are equal',
        () {
      expect(detectTriangle(2, 2, 3), "isosceles triangle");
      expect(detectTriangle(4, 2, 4), "isosceles triangle");
      expect(detectTriangle(4, 1, 4), "isosceles triangle");
      expect(detectTriangle(1, 2, 2), "isosceles triangle");
    });

    test('Should return "Scalene Triangle" when no sides are equal', () {
      expect(detectTriangle(2, 4, 3), "scalene triangle");
    });
  });
}
