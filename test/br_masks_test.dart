import 'package:br_validators/br_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BRMasks', () {
    test('Masks CPF correctly', () {
      final cpfFormatter = BRMasks.cpf;
      String maskedCPF = cpfFormatter.maskText('12345678901');

      expect(maskedCPF, '123.456.789-01');
    });

    test('Masks CEP correctly', () {
      final cepFormatter = BRMasks.cep;
      String maskedCEP = cepFormatter.maskText('12345678');

      expect(maskedCEP, '12345-678');
    });

    test('Masks CNH correctly', () {
      final cnhFormatter = BRMasks.cnh;
      String maskedCNH = cnhFormatter.maskText('12345678901');

      expect(maskedCNH, '12345678901');
    });

    test('Masks CNPJ correctly', () {
      final cnpjFormatter = BRMasks.cnpj;
      String maskedCNPJ = cnpjFormatter.maskText('12345678901234');

      expect(maskedCNPJ, '12.345.678/9012-34');
    });

    test('Masks celular correctly', () {
      final mobilePhoneFormatter = BRMasks.mobilePhone;
      String maskedCelular = mobilePhoneFormatter.maskText('12345678901');

      expect(maskedCelular, '(12) 34567-8901');
    });

    test('Masks telefoneFixo correctly', () {
      final landlinePhoneFormatter = BRMasks.landlinePhone;
      String maskedLandlinePhone =
          landlinePhoneFormatter.maskText('1234567890');

      expect(maskedLandlinePhone, '(12) 3456-7890');
    });

    test('Masks pisPasep correctly', () {
      final pisPasepFormatter = BRMasks.pisPasep;
      String maskedPISPASEP = pisPasepFormatter.maskText('12345678901');

      expect(maskedPISPASEP, '123.45678.90-1');
    });

    test('Masks data correctly', () {
      final dataFormatter = BRMasks.date;
      String maskedData = dataFormatter.maskText('31122020');

      expect(maskedData, '31/12/2020');
    });
  });
}
