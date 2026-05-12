part of br_validator;

/// Class for validating Brazilian Título de Eleitor (voter registration) numbers.
class _TituloEleitorValidator {
  /// Validates a Brazilian Título de Eleitor number.
  ///
  /// The number must have exactly 12 digits (formatting characters are stripped).
  /// Structure: 8 sequential digits + 2 state digits + 2 check digits.
  ///
  /// Returns `true` if the number is valid, otherwise `false`.
  static bool validate(String titulo) {
    titulo = titulo.replaceAll(RegExp(r'[\s.\-]'), '');

    if (titulo.length != 12 || !RegExp(r'^\d{12}$').hasMatch(titulo)) {
      return false;
    }

    final digits = titulo.split('').map(int.parse).toList();
    final stateCode = int.parse(titulo.substring(8, 10));

    // State codes 01–28 are valid; 00 and >28 are not.
    if (stateCode == 0 || stateCode > 28) return false;

    // First check digit (position 11).
    const firstWeights = [2, 3, 4, 5, 6, 7, 8, 9];
    int sum1 = 0;
    for (int i = 0; i < 8; i++) {
      sum1 += digits[i] * firstWeights[i];
    }
    int rem1 = sum1 % 11;
    // SP (01) and MG (02): remainder 0 → check digit 1; remainder 1 → invalid.
    // All other states: remainder 0 or 1 → check digit 0.
    int check1;
    if (stateCode == 1 || stateCode == 2) {
      if (rem1 == 1) return false;
      check1 = rem1 == 0 ? 1 : 11 - rem1;
    } else {
      check1 = (rem1 < 2) ? 0 : 11 - rem1;
    }

    if (check1 != digits[10]) return false;

    // Second check digit (position 12).
    int sum2 = digits[8] * 7 + digits[9] * 8 + check1 * 9;
    int rem2 = sum2 % 11;
    int check2;
    if (stateCode == 1 || stateCode == 2) {
      if (rem2 == 1) return false;
      check2 = rem2 == 0 ? 1 : 11 - rem2;
    } else {
      check2 = (rem2 < 2) ? 0 : 11 - rem2;
    }

    return check2 == digits[11];
  }
}
