part of br_validators;

class _CPFValidator {
  static bool validate(String cpf) {
    cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    if (cpf.length != 11) {
      return false;
    }
    List<int> numbers = cpf.split('').map(int.parse).toList();
    int firstSum = 0;
    for (int i = 0; i < 9; i++) {
      firstSum += numbers[i] * (10 - i);
    }
    int firstDigit = (firstSum % 11 < 2) ? 0 : 11 - (firstSum % 11);
    if (firstDigit != numbers[9]) {
      return false;
    }
    int secondSum = 0;
    for (int i = 0; i < 10; i++) {
      secondSum += numbers[i] * (11 - i);
    }
    int secondDigit = (secondSum % 11 < 2) ? 0 : 11 - (secondSum % 11);
    if (secondDigit != numbers[10]) {
      return false;
    }
    return true;
  }
}
