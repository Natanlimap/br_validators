part of br_validator;

/// Class for validating Brazilian PIS/PASEP numbers.
class _PisPasepValidator {
  /// Validates a Brazilian PIS/PASEP number.
  ///
  /// The PIS/PASEP number should be a string consisting of 11 digits.
  /// It may include non-digit characters, which will be removed before validation.
  ///
  /// Returns `true` if the PIS/PASEP number is valid, otherwise `false`.
  static bool validate(String pisPasepNumber) {
    pisPasepNumber = pisPasepNumber.replaceAll(RegExp(r'[^\d]'), '');

    if (pisPasepNumber.length != 11) {
      return false;
    }

    int sum = 0;
    List<int> weights = [3, 2, 9, 8, 7, 6, 5, 4, 3, 2];

    for (int i = 0; i < 10; i++) {
      sum += int.parse(pisPasepNumber[i]) * weights[i];
    }

    int remainder = sum % 11;
    int checkDigit = 11 - remainder;

    if (checkDigit == 10 || checkDigit == 11) {
      checkDigit = 0;
    }

    int lastDigit = int.parse(pisPasepNumber[10]);

    return checkDigit == lastDigit;
  }
}
