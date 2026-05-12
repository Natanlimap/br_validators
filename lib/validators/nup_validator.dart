part of br_validator;

/// Class for validating Brazilian NUP (Número Único de Protocolo).
class _NUPValidator {
  /// Validates a Brazilian NUP government process number.
  ///
  /// Format: `OOOOO.SSSSSS/AAAA-DD` where O=organ (5), S=sequence (6),
  /// A=year (4), D=check digits (2). Formatting characters are stripped.
  ///
  /// Returns `true` if the NUP is valid, otherwise `false`.
  static bool validate(String nup) {
    nup = nup.replaceAll(RegExp(r'[.\-/\s]'), '');

    if (nup.length != 17 || !RegExp(r'^\d{17}$').hasMatch(nup)) return false;

    final base = nup.substring(0, 15);
    final checkDigits = int.parse(nup.substring(15, 17));

    // Weights cycle 2–9 right-to-left over the 15 base digits.
    int sum = 0;
    int weight = 2;
    for (int i = base.length - 1; i >= 0; i--) {
      sum += int.parse(base[i]) * weight;
      weight = weight == 9 ? 2 : weight + 1;
    }

    final remainder = sum % 11;
    final expected = remainder < 2 ? 0 : 11 - remainder;

    // The two-digit check field encodes the single check digit with a leading zero.
    return checkDigits == expected;
  }
}
