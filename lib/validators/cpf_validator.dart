part of br_validator;

/// Class for validating Brazilian CPF (Individual Taxpayer Registry) numbers.
class _CPFValidator {
  /// Validates a Brazilian CPF (Individual Taxpayer Registry) number.
  ///
  /// The CPF number should be a string consisting of 11 digits.
  /// It may include non-digit characters, which will be removed before validation.
  ///
  /// Returns `true` if the CPF is valid, otherwise `false`.
  static bool validate(String cpf) {
    cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    if (cpf.length != 11) {
      return false;
    }

    // Reject sequences like 000.000.000-00, 111.111.111-11, etc.
    if (RegExp(r'^(.)\1{10}$').hasMatch(cpf)) {
      return false;
    }

    List<int> numbers = cpf.split('').map(int.parse).toList();
    int firstSum = 0;

    for (int i = 0; i < 9; i++) {
      firstSum += numbers[i] * (10 - i);
    }

    int firstDigit = (firstSum % 11 < 2) ? 0 : 11 - (firstSum % 11);

    if (firstDigit != numbers[9]) {
      return false;
    }

    int secondSum = 0;

    for (int i = 0; i < 10; i++) {
      secondSum += numbers[i] * (11 - i);
    }

    int secondDigit = (secondSum % 11 < 2) ? 0 : 11 - (secondSum % 11);

    if (secondDigit != numbers[10]) {
      return false;
    }

    return true;
  }
}
