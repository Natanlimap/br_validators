part of br_validators;

class _CNHValidator {
  static bool validate(String cnh) {
    if (cnh.length != 11) {
      return false;
    }

    int verificationDigit1Adjustment = 0;
    int sum1 = 0;

    for (int i = 0, weight = 9; i < 9; i++, weight--) {
      sum1 += int.parse(cnh[i]) * weight;
    }

    int verificationDigit1 = sum1 % 11;

    if (verificationDigit1 >= 10) {
      verificationDigit1 = 0;
      verificationDigit1Adjustment = 2;
    }

    int sum2 = 0;
    for (int i = 0, weight = 1; i < 9; i++, weight++) {
      sum2 += int.parse(cnh[i]) * weight;
    }

    int verificationDigit2 =
        (sum2 % 11 >= 10) ? 0 : sum2 % 11 - verificationDigit1Adjustment;

    String expectedDigits =
        verificationDigit1.toString() + verificationDigit2.toString();
    String actualDigits = cnh.substring(cnh.length - 2);

    return expectedDigits == actualDigits;
  }
}