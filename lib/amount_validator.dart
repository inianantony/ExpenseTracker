class AmountValidator {
  bool isValidAmount(String s) {
    if (s == null || double.tryParse(s) == null) {
      return false;
    }
    var value = double.tryParse(s);
    if (value <= 0) return false;
    return true;
  }
}
