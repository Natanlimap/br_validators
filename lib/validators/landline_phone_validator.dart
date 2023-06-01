part of br_validators;

/// Class for validating Brazilian landline phone numbers.
class _LandlinePhoneValidator {
  /// Validates a Brazilian landline phone number.
  ///
  /// The landline phone number should be a string consisting of 8 digits.
  /// It may include non-digit characters, which will be removed before validation.
  ///
  /// Returns `true` if the landline phone number is valid, otherwise `false`.
  static bool validate(String landlinePhone) {
    landlinePhone = landlinePhone.replaceAll(RegExp(r'[^\d]'), '');

    if (landlinePhone.length != 8) {
      return false;
    }

    int firstDigit = int.parse(landlinePhone[0]);

    if (firstDigit < 2 || firstDigit > 5) {
      return false;
    }

    return true;
  }
}
