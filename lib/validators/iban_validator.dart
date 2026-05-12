part of br_validator;

/// Class for validating Brazilian IBAN numbers.
class _IBANValidator {
  /// Validates a Brazilian IBAN.
  ///
  /// Format: `BRkk BBBBB SSSSS CCCCCCCCCC T N` (29 chars with spaces, 25 without).
  /// Uses the standard ISO 13616 mod-97 algorithm.
  ///
  /// Returns `true` if the IBAN is valid, otherwise `false`.
  static bool validate(String iban) {
    iban = iban.replaceAll(RegExp(r'\s'), '').toUpperCase();

    if (iban.length != 29) return false;
    if (!iban.startsWith('BR')) return false;
    if (!RegExp(r'^BR\d{25}[A-Z]\d$').hasMatch(iban)) return false;

    // Move first 4 chars to end, then convert letters to digits (A=10…Z=35).
    final rearranged = iban.substring(4) + iban.substring(0, 4);
    final numeric = rearranged.split('').map((c) {
      final code = c.codeUnitAt(0);
      return code >= 65 ? (code - 55).toString() : c;
    }).join();

    // mod-97 digit-by-digit to avoid integer overflow.
    int remainder = 0;
    for (final ch in numeric.split('')) {
      remainder = (remainder * 10 + int.parse(ch)) % 97;
    }

    return remainder == 1;
  }
}
