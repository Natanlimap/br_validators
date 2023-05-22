library br_validators;

part 'cpf_validator.dart';
part 'cnpj_validator.dart';
part 'pis_pasep_validator.dart';
part 'cep_validator.dart';
part 'landline_phone_validator.dart';
part 'phone_number_validator.dart';
part 'cnh_validator.dart';

class BRValidators {
  static bool validateCPF(String cpf) {
    return _CPFValidator.validate(cpf);
  }

  static bool validateCNPJ(String cnpj) {
    return _CNPJValidator.validate(cnpj);
  }

  static bool validatePISPASEP(String pisPasep) {
    return _PisPasepValidator.validate(pisPasep);
  }

  static bool validateCEP(String cep) {
    return _CEPValidator.validate(cep);
  }

  static bool validateLandlinePhone(String landlinePhone) {
    return _LandlinePhoneValidator.validate(landlinePhone);
  }

  static bool validateMobileNumber(String mobileNumber) {
    return _PhoneNumberValidator.validate(mobileNumber);
  }

  static bool validatePhoneNumber(String phoneNumber) {
    return _PhoneNumberValidator.validate(phoneNumber);
  }

  static bool validateCNH(String cnh) {
    return _CNHValidator.validate(cnh);
  }
}
