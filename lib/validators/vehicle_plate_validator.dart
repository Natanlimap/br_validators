part of br_validator;

/// Class for validating Brazilian vehicle license plates.
class _VehiclePlateValidator {
  /// Validates a Brazilian vehicle license plate.
  ///
  /// Accepts two formats:
  /// - Legacy: `ABC-1234` or `ABC1234` (3 letters + 4 digits)
  /// - Mercosul: `ABC1D23` or `ABC-1D23` (3 letters + 1 digit + 1 letter + 2 digits)
  ///
  /// Returns `true` if the plate matches one of the valid formats.
  static bool validate(String plate) {
    plate = plate.replaceAll(RegExp(r'[-\s]'), '').toUpperCase();
    return _isLegacy(plate) || _isMercosul(plate);
  }

  static bool _isLegacy(String plate) =>
      RegExp(r'^[A-Z]{3}[0-9]{4}$').hasMatch(plate);

  static bool _isMercosul(String plate) =>
      RegExp(r'^[A-Z]{3}[0-9][A-Z][0-9]{2}$').hasMatch(plate);
}
