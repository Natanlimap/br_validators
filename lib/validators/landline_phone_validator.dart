part of br_validators;

class _LandlinePhoneValidator {
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
