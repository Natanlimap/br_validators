part of br_validators;

/// Class for validating Brazilian phone numbers.
class _PhoneNumberValidator {
  /// Validates a Brazilian phone number.
  ///
  /// The phone number should be a string consisting of 9 or 11 digits.
  /// It may include non-digit characters, which will be removed before validation.
  ///
  /// Returns `true` if the phone number is valid, otherwise `false`.
  static bool validate(String mobileNumber) {
    mobileNumber = mobileNumber.replaceAll(RegExp(r'[^\d]'), '');

    if (mobileNumber.length != 9 && mobileNumber.length != 11) {
      return false;
    }

    int firstDigit = int.parse(mobileNumber[0]);

    if (mobileNumber.length == 9 && firstDigit != 9) {
      return false;
    }

    if (mobileNumber.length == 11 && (firstDigit != 9 && firstDigit != 8)) {
      return false;
    }

    return true;
  }
}
