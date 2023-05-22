part of br_validators;

class _PhoneNumberValidator {
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
