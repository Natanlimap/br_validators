part of br_validators;

class _CNPJValidator {
  static bool validate(String cnpj) {
    cnpj = cnpj.replaceAll(RegExp(r'[^0-9]'), '');

    if (cnpj.length != 14) {
      return false;
    }

    List<int> numbers = cnpj.split('').map(int.parse).toList();
    List<int> firstTwelveDigits = numbers.sublist(0, 12);
    int firstVerifierDigit = numbers[12];
    int secondVerifierDigit = numbers[13];
    List<int> firstWeights = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    int firstSum = 0;

    for (int i = 0; i < 12; i++) {
      firstSum += firstTwelveDigits[i] * firstWeights[i];
    }

    int firstDigit = firstSum % 11 < 2 ? 0 : 11 - (firstSum % 11);

    if (firstDigit != firstVerifierDigit) {
      return false;
    }

    List<int> secondWeights = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    List<int> secondThirteenDigits = [...firstTwelveDigits, firstDigit];
    int secondSum = 0;

    for (int i = 0; i < 13; i++) {
      secondSum += secondThirteenDigits[i] * secondWeights[i];
    }

    int secondDigit = secondSum % 11 < 2 ? 0 : 11 - (secondSum % 11);
    if (secondDigit != secondVerifierDigit) {
      return false;
    }

    return true;
  }
}
