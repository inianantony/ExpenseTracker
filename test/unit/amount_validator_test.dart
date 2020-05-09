import 'package:expense_tracker/amount_validator.dart';
import 'package:test/test.dart';

void main() {
  group('NumberValidatorTests', () {
    test('isNumeric should return false when ' ' is passed', () {
      expect(AmountValidator().isValidAmount(""), false);
    });
    test('isNumeric should return false when any string is passed', () {
      expect(AmountValidator().isValidAmount("test"), false);
    });
    test('isNumeric should return true when integer is passed', () {
      expect(AmountValidator().isValidAmount("10"), true);
    });
    test('isNumeric should return true when decimal is passed', () {
      expect(AmountValidator().isValidAmount("10.50"), true);
    });
    test('isNumeric should return false when 0 is passed', () {
      expect(AmountValidator().isValidAmount("0"), false);
    });
    test('isNumeric should return false when 0 is passed', () {
      expect(AmountValidator().isValidAmount("0"), false);
    });
    test('isNumeric should return false when -ve is passed', () {
      expect(AmountValidator().isValidAmount("-1"), false);
    });
    test('isNumeric should return false when -ve 0 is passed', () {
      expect(AmountValidator().isValidAmount("-0"), false);
    });
  });
}