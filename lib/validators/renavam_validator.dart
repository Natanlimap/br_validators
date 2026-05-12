part of br_validator;

/// Class for validating Brazilian RENAVAM (vehicle registration) numbers.
class _RenavamValidator {
  /// Validates a Brazilian RENAVAM number.
  ///
  /// Accepts 9 or 11 digits (formatting characters are stripped).
  /// Uses modulo-11 with weights [3, 2, 9, 8, 7, 6, 5, 4, 3, 2].
  ///
  /// Returns `true` if the RENAVAM is valid, otherwise `false`.
  static bool validate(String renavam) {
    renavam = renavam.replaceAll(RegExp(r'[.\-\s]'), '');

    if (renavam.length == 11) {
      renavam = renavam.substring(2);
    }

    if (renavam.length != 9 || !RegExp(r'^\d{9}$').hasMatch(renavam)) {
      return false;
    }

    const weights = [3, 2, 9, 8, 7, 6, 5, 4, 3];
    int sum = 0;
    for (int i = 0; i < 8; i++) {
      sum += int.parse(renavam[i]) * weights[i];
    }

    int remainder = sum % 11;
    int checkDigit = remainder == 0 || remainder == 1 ? 0 : 11 - remainder;

    return checkDigit == int.parse(renavam[8]);
  }
}
