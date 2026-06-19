part of br_validator;

/// Class for validating Brazilian PIX keys.
class _PixKeyValidator {
  /// Validates a PIX key.
  ///
  /// Accepts the five key types defined by Banco Central do Brasil:
  /// - CPF (11 digits)
  /// - CNPJ (14 alphanumeric chars)
  /// - E-mail (up to 77 chars)
  /// - Phone number (+55 followed by 10 or 11 digits)
  /// - Random key (UUID v4 format)
  ///
  /// Returns `true` if the key matches one of the valid formats.
  static bool validate(String key) {
    key = key.trim();

    return _isCpf(key) ||
        _isCnpj(key) ||
        _isEmail(key) ||
        _isPhone(key) ||
        _isRandomKey(key);
  }

  static bool _isCpf(String key) => _CPFValidator.validate(key);

  static bool _isCnpj(String key) => _CNPJValidator.validate(key);

  static bool _isEmail(String key) =>
      key.length <= 77 &&
      RegExp(r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$')
          .hasMatch(key);

  // Phone: +55 followed by 10 (landline) or 11 (mobile) digits.
  static bool _isPhone(String key) => RegExp(r'^\+55\d{10,11}$').hasMatch(key);

  // UUID v4: xxxxxxxx-xxxx-4xxx-[89ab]xxx-xxxxxxxxxxxx
  static bool _isRandomKey(String key) => RegExp(
        r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
        caseSensitive: false,
      ).hasMatch(key);
}
