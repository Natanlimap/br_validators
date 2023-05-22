part of br_validators;

class _CEPValidator {
  static bool validate(String cep) {
    cep = cep.replaceAll(RegExp(r'[^\d]'), '');

    if (cep.length != 8) {
      return false;
    }

    return true;
  }
}
