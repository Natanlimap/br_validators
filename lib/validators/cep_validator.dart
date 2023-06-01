part of br_validator;

/// Class for validating Brazilian CEP (Postal Code) numbers.
class _CEPValidator {
  /// Validates a Brazilian CEP (Postal Code) number.
  ///
  /// The CEP number should be a string consisting of 8 digits.
  /// It may include non-digit characters, which will be removed before validation.
  ///
  /// Returns `true` if the CEP is valid, otherwise `false`.
  static bool validate(String cep) {
    cep = cep.replaceAll(RegExp(r'[^\d]'), '');

    if (cep.length != 8) {
      return false;
    }

    return true;
  }
}
