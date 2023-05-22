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
}
