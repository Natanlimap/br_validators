part of br_validator;

/// Class for validating Brazilian passport numbers.
class _PassportValidator {
  /// Validates a Brazilian passport number.
  ///
  /// Format: 2 uppercase letters followed by 6 digits (e.g. `AB123456`).
  /// Formatting characters are stripped before validation.
  ///
  /// Returns `true` if the passport number matches the expected format.
  static bool validate(String passport) {
    passport = passport.replaceAll(RegExp(r'[\s\-]'), '').toUpperCase();
    return RegExp(r'^[A-Z]{2}[0-9]{6}$').hasMatch(passport);
  }
}
