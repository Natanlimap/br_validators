part of br_validator;

/// Class for validating Brazilian state abbreviations (UF).
class _UFValidator {
  static const _validUFs = {
    'AC',
    'AL',
    'AM',
    'AP',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MG',
    'MS',
    'MT',
    'PA',
    'PB',
    'PE',
    'PI',
    'PR',
    'RJ',
    'RN',
    'RO',
    'RR',
    'RS',
    'SC',
    'SE',
    'SP',
    'TO',
  };

  /// Validates a Brazilian state abbreviation.
  ///
  /// Returns `true` if [uf] is one of the 27 valid state codes (case-insensitive).
  static bool validate(String uf) =>
      _validUFs.contains(uf.trim().toUpperCase());
}
