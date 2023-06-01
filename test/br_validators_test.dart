import 'package:br_validators/validators/br_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CPF validator', () {
    test('Valid CPF should return true', () {
      expect(BRValidators.validateCPF('12687494003'), true);
      expect(BRValidators.validateCPF('664.349.810-40'), true);
    });

    test('Invalid CPF should return false', () {
      expect(BRValidators.validateCPF('123'), false);
      expect(BRValidators.validateCPF('12345678901'), false);
      expect(BRValidators.validateCPF('123.456.789-01'), false);
    });
  });

  group('PISPASEP validator', () {
    test('Valid PISPASEP should return true', () {
      expect(BRValidators.validatePISPASEP('081.43434.08-5'), true);
      expect(BRValidators.validatePISPASEP('51757815531'), true);
    });

    test('Invalid CPF should return false', () {
      expect(BRValidators.validatePISPASEP('123'), false);
      expect(BRValidators.validatePISPASEP('12345678901'), false);
      expect(BRValidators.validatePISPASEP('123.456.789-01'), false);
    });
  });

  group('CNPJ validator', () {
    test('Valid CNPJ should return true', () {
      expect(BRValidators.validateCNPJ('69.404.688/0001-71'), true);
      expect(BRValidators.validateCNPJ('95385916000113'), true);
    });

    test('Invalid CNPJ should return false', () {
      expect(BRValidators.validateCNPJ('123'), false);
      expect(BRValidators.validateCNPJ('12345678000191'), false);
      expect(BRValidators.validateCNPJ('12.345.678/0001-91'), false);
    });
  });
  group('CEP validator', () {
    test('Valid CEP should return true', () {
      expect(BRValidators.validateCEP('12345678'), true);
      expect(BRValidators.validateCEP('12345-678'), true);
    });

    test('Invalid CEP should return false', () {
      expect(BRValidators.validateCEP('123'), false);
      expect(BRValidators.validateCEP('123456789'), false);
      expect(BRValidators.validateCEP('12345-6789'), false);
    });
  });

  group('Landline phone validator', () {
    //create tests
    test('Valid landline phone should return true', () {
      expect(BRValidators.validateLandlinePhone('3333-3333'), true);
      expect(BRValidators.validateLandlinePhone('33333333'), true);
    });

    test('Invalid landline phone should return false', () {
      expect(BRValidators.validateLandlinePhone('3333-3A33'), false);
      expect(BRValidators.validateLandlinePhone('123'), false);
      expect(BRValidators.validateLandlinePhone('123456789'), false);
      expect(BRValidators.validateLandlinePhone('1234567A'), false);
    });
  });

  group('Phone Number validator', () {
    //create tests
    test('Valid phone number should return true', () {
      expect(BRValidators.validateMobileNumber('999999999'), true);
      expect(BRValidators.validateMobileNumber('99999-9999'), true);
    });

    test('Invalid phone number should return false', () {
      expect(BRValidators.validateMobileNumber(' 99999999'), false);
      expect(BRValidators.validateMobileNumber('9999999999'), false);
      expect(BRValidators.validateMobileNumber('99999-99999'), false);
      expect(BRValidators.validateMobileNumber('99999-999'), false);
      expect(BRValidators.validateMobileNumber('99999-99A9'), false);
      expect(BRValidators.validateMobileNumber('99999-99A9'), false);
    });
  });

  group('CNH validator', () {
    //create tests
    test('Valid CNH should return true', () {
      expect(BRValidators.validateCNH('86647296043'), true);
      expect(BRValidators.validateCNH('06846841061'), true);
    });

    test('Invalid CNH should return false', () {
      expect(BRValidators.validateCNH('72445968612'), false);
      expect(BRValidators.validateCNH('06846841064'), false);
    });
  });
}
