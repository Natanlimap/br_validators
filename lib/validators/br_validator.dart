/// Library containing validators for Brazilian documents.
library br_validator;

part 'cpf_validator.dart';
part 'cnpj_validator.dart';
part 'pis_pasep_validator.dart';
part 'cep_validator.dart';
part 'landline_phone_validator.dart';
part 'phone_number_validator.dart';
part 'cnh_validator.dart';

/// Class that contains methods for validating Brazilian documents.
class BRValidators {
  /// Validates a CPF (Brazilian Individual Taxpayer Registry) number.
  static bool validateCPF(String cpf) {
    return _CPFValidator.validate(cpf);
  }

  /// Validates a CNPJ (National Registry of Legal Entities) number.
  static bool validateCNPJ(String cnpj) {
    return _CNPJValidator.validate(cnpj);
  }

  /// Validates a PIS/PASEP (Social Integration Program/Program for the Formation of Public Servers) number.
  static bool validatePISPASEP(String pisPasep) {
    return _PisPasepValidator.validate(pisPasep);
  }

  /// Validates a CEP (Postal Code).
  static bool validateCEP(String cep) {
    return _CEPValidator.validate(cep);
  }

  /// Validates a landline phone number.
  static bool validateLandlinePhone(String landlinePhone) {
    return _LandlinePhoneValidator.validate(landlinePhone);
  }

  /// Validates a mobile phone number.
  static bool validateMobileNumber(String mobileNumber) {
    return _PhoneNumberValidator.validate(mobileNumber);
  }

  /// Validates a CNH (National Driver's License).
  static bool validateCNH(String cnh) {
    return _CNHValidator.validate(cnh);
  }
}
