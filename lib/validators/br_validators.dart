library br_validators;

part 'cpf_validator.dart';
part 'cnpj_validator.dart';

class BRValidators {
  static bool validateCPF(String cpf) {
    return _CPFValidator.validate(cpf);
  }

  static bool validateCNPJ(String cnpj) {
    return _CNPJValidator.validate(cnpj);
  }
}
