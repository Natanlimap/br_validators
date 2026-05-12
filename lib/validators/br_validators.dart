/// Library containing validators for Brazilian documents.
library br_validator;

part 'cpf_validator.dart';
part 'cnpj_validator.dart';
part 'pis_pasep_validator.dart';
part 'cep_validator.dart';
part 'landline_phone_validator.dart';
part 'phone_number_validator.dart';
part 'cnh_validator.dart';
part 'pix_key_validator.dart';
part 'vehicle_plate_validator.dart';
part 'renavam_validator.dart';
part 'ie_validator.dart';
part 'titulo_eleitor_validator.dart';
part 'iban_validator.dart';
part 'passport_validator.dart';
part 'uf_validator.dart';
part 'nup_validator.dart';

/// Class that contains methods for validating Brazilian documents.
class BRValidators {
  /// Validates a CPF (Brazilian Individual Taxpayer Registry) number.
  static bool validateCPF(String cpf) => _CPFValidator.validate(cpf);

  /// Validates a CNPJ (National Registry of Legal Entities) number.
  /// Supports both numeric and alphanumeric formats (IN RFB 2.229/2024).
  static bool validateCNPJ(String cnpj) => _CNPJValidator.validate(cnpj);

  /// Validates a PIS/PASEP number.
  static bool validatePISPASEP(String pisPasep) =>
      _PisPasepValidator.validate(pisPasep);

  /// Validates a CEP (Postal Code).
  static bool validateCEP(String cep) => _CEPValidator.validate(cep);

  /// Validates a landline phone number.
  static bool validateLandlinePhone(String landlinePhone) =>
      _LandlinePhoneValidator.validate(landlinePhone);

  /// Validates a mobile phone number.
  static bool validateMobileNumber(String mobileNumber) =>
      _PhoneNumberValidator.validate(mobileNumber);

  /// Validates a CNH (National Driver's License).
  static bool validateCNH(String cnh) => _CNHValidator.validate(cnh);

  /// Validates a PIX key (CPF, CNPJ, e-mail, phone or random UUID key).
  static bool validatePixKey(String key) => _PixKeyValidator.validate(key);

  /// Validates a Brazilian vehicle license plate (legacy or Mercosul format).
  static bool validateVehiclePlate(String plate) =>
      _VehiclePlateValidator.validate(plate);

  /// Validates a RENAVAM (vehicle registration) number.
  static bool validateRENAVAM(String renavam) =>
      _RenavamValidator.validate(renavam);

  /// Validates an Inscrição Estadual (state tax registration) for the given [uf].
  static bool validateIE(String ie, String uf) =>
      _IEValidator.validate(ie, uf);

  /// Validates a Título de Eleitor (voter registration card) number.
  static bool validateTituloEleitor(String titulo) =>
      _TituloEleitorValidator.validate(titulo);

  /// Validates a Brazilian IBAN number.
  static bool validateIBAN(String iban) => _IBANValidator.validate(iban);

  /// Validates a Brazilian passport number (2 letters + 6 digits).
  static bool validatePassport(String passport) =>
      _PassportValidator.validate(passport);

  /// Validates a Brazilian state abbreviation (UF).
  static bool validateUF(String uf) => _UFValidator.validate(uf);

  /// Validates a NUP (Número Único de Protocolo) government process number.
  static bool validateNUP(String nup) => _NUPValidator.validate(nup);
}
