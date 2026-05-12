part of br_validator;

/// Class for validating Brazilian CNPJ (National Registry of Legal Entities) numbers.
class _CNPJValidator {
  /// Validates a Brazilian CNPJ (National Registry of Legal Entities) number.
  ///
  /// Supports both the legacy numeric format (14 digits) and the alphanumeric
  /// format introduced by IN RFB 2.229/2024 (12 alphanumeric chars + 2 check digits).
  /// Formatting characters (`.`, `/`, `-`) are stripped before validation.
  ///
  /// Returns `true` if the CNPJ is valid, otherwise `false`.
  static bool validate(String cnpj) {
    cnpj = cnpj.replaceAll(RegExp(r'[.\/\-\s]'), '').toUpperCase();

    if (cnpj.length != 14) {
      return false;
    }

    // First 12 chars are alphanumeric; last 2 must be digits.
    if (!RegExp(r'^[A-Z0-9]{12}[0-9]{2}$').hasMatch(cnpj)) {
      return false;
    }

    // Reject sequences where all 12 base characters are the same (e.g. 000000000000).
    if (RegExp(r'^(.)\1{11}').hasMatch(cnpj.substring(0, 12))) {
      return false;
    }

    List<int> values = cnpj.split('').map(_charValue).toList();

    const firstWeights = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    int firstSum = 0;
    for (int i = 0; i < 12; i++) {
      firstSum += values[i] * firstWeights[i];
    }
    int firstDigit = firstSum % 11 < 2 ? 0 : 11 - (firstSum % 11);

    if (firstDigit != values[12]) {
      return false;
    }

    const secondWeights = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    int secondSum = 0;
    for (int i = 0; i < 13; i++) {
      secondSum += values[i] * secondWeights[i];
    }
    int secondDigit = secondSum % 11 < 2 ? 0 : 11 - (secondSum % 11);

    return secondDigit == values[13];
  }

  /// Converts an alphanumeric character to its numeric value for CNPJ calculation.
  /// According to the new RFB rules, the value is simply `ASCII(char) - 48`.
  static int _charValue(String char) {
    return char.codeUnitAt(0) - 48;
  }
}
