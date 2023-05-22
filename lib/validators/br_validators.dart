library br_validators;

part 'cpf_validator.dart';

class BRValidators {
  static bool validateCPF(String cpf) {
    return _CPFValidator.validate(cpf);
  }
}
