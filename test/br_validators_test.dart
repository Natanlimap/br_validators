import 'package:br_validators/validators/br_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // ── CPF ─────────────────────────────────────────────────────────────────────
  group('CPF validator', () {
    test('valid CPF — bare digits', () {
      expect(BRValidators.validateCPF('12687494003'), true);
      expect(BRValidators.validateCPF('66434981040'), true);
      expect(BRValidators.validateCPF('52998224725'), true);
    });

    test('valid CPF — formatted with mask', () {
      expect(BRValidators.validateCPF('664.349.810-40'), true);
      expect(BRValidators.validateCPF('126.874.940-03'), true);
    });

    test('invalid CPF — wrong check digit', () {
      expect(BRValidators.validateCPF('12345678901'), false);
      expect(BRValidators.validateCPF('123.456.789-01'), false);
    });

    test('invalid CPF — too short / too long', () {
      expect(BRValidators.validateCPF('123'), false);
      expect(BRValidators.validateCPF('123456789012'), false);
      expect(BRValidators.validateCPF(''), false);
    });

    test('invalid CPF — all same digit (repeated sequence)', () {
      for (int d = 0; d <= 9; d++) {
        expect(BRValidators.validateCPF(d.toString() * 11), false,
            reason: 'all-$d sequence must be rejected');
      }
    });

    test('invalid CPF — non-digit characters that corrupt the number', () {
      // 'A' causes the stripped string to be 10 digits → invalid length
      expect(BRValidators.validateCPF('1268749400A'), false);
      // Actual wrong check digit after stripping non-digits
      expect(BRValidators.validateCPF('126.874.940-04'), false);
    });
  });

  // ── CNPJ ────────────────────────────────────────────────────────────────────
  group('CNPJ validator', () {
    test('valid numeric CNPJ — bare digits', () {
      expect(BRValidators.validateCNPJ('69404688000171'), true);
      expect(BRValidators.validateCNPJ('95385916000113'), true);
      expect(BRValidators.validateCNPJ('11222333000181'), true);
    });

    test('valid numeric CNPJ — formatted', () {
      expect(BRValidators.validateCNPJ('69.404.688/0001-71'), true);
      expect(BRValidators.validateCNPJ('95.385.916/0001-13'), true);
    });

    test('valid alphanumeric CNPJ — bare', () {
      expect(BRValidators.validateCNPJ('NZK5MGM2000174'), true);
    });

    test('valid alphanumeric CNPJ — formatted', () {
      expect(BRValidators.validateCNPJ('NZ.K5M.GM2/0001-74'), true);
      expect(BRValidators.validateCNPJ('19.YRN.ME2/0001-70'), true);
      expect(BRValidators.validateCNPJ('19.YRN.ME2/MN01-67'), true);
      expect(BRValidators.validateCNPJ('27.DWD.5H7/0001-85'), true);
      expect(BRValidators.validateCNPJ('9A.BX0.PHA/0001-61'), true);
      expect(BRValidators.validateCNPJ('EK.R8E.HNA/0001-80'), true);
      expect(BRValidators.validateCNPJ('5A.2K1.WP3/0001-85'), true);
    });

    test('valid alphanumeric CNPJ — lowercase is accepted', () {
      expect(BRValidators.validateCNPJ('nzk5mgm2000174'), true);
    });

    test('invalid CNPJ — wrong check digits', () {
      expect(BRValidators.validateCNPJ('69404688000172'), false);
      expect(BRValidators.validateCNPJ('12345678000191'), false);
      expect(BRValidators.validateCNPJ('1A2B3C4D5E6F00'), false);
    });

    test('invalid CNPJ — all same base character', () {
      expect(BRValidators.validateCNPJ('00000000000000'), false);
      expect(BRValidators.validateCNPJ('11111111111111'), false);
      expect(BRValidators.validateCNPJ('AAAAAAAAAAAA00'), false);
    });

    test('invalid CNPJ — wrong length', () {
      expect(BRValidators.validateCNPJ('123'), false);
      expect(BRValidators.validateCNPJ(''), false);
      expect(BRValidators.validateCNPJ('695046880001710'), false);
    });

    test('invalid CNPJ — letter in check-digit positions', () {
      expect(BRValidators.validateCNPJ('1A2B3C4D5E6FAB'), false);
    });
  });

  // ── PIS/PASEP ───────────────────────────────────────────────────────────────
  group('PIS/PASEP validator', () {
    test('valid PIS/PASEP — bare and formatted', () {
      expect(BRValidators.validatePISPASEP('08143434085'), true);
      expect(BRValidators.validatePISPASEP('081.43434.08-5'), true);
      expect(BRValidators.validatePISPASEP('51757815531'), true);
    });

    test('invalid PIS/PASEP — wrong check digit', () {
      expect(BRValidators.validatePISPASEP('12345678901'), false);
      expect(BRValidators.validatePISPASEP('123.456.789-01'), false);
    });

    test('invalid PIS/PASEP — wrong length', () {
      expect(BRValidators.validatePISPASEP('123'), false);
      expect(BRValidators.validatePISPASEP(''), false);
      expect(BRValidators.validatePISPASEP('123456789012'), false);
    });
  });

  // ── CEP ─────────────────────────────────────────────────────────────────────
  group('CEP validator', () {
    test('valid CEP — bare and formatted', () {
      expect(BRValidators.validateCEP('12345678'), true);
      expect(BRValidators.validateCEP('12345-678'), true);
      expect(BRValidators.validateCEP('01310100'), true);
      expect(BRValidators.validateCEP('01310-100'), true);
    });

    test('invalid CEP — wrong length', () {
      expect(BRValidators.validateCEP('123'), false);
      expect(BRValidators.validateCEP('123456789'), false);
      expect(BRValidators.validateCEP('12345-6789'), false);
      expect(BRValidators.validateCEP(''), false);
    });

    test('invalid CEP — non-digit characters', () {
      expect(BRValidators.validateCEP('1234567A'), false);
      expect(BRValidators.validateCEP('ABCDE-FGH'), false);
    });
  });

  // ── Landline phone ──────────────────────────────────────────────────────────
  group('Landline phone validator', () {
    test('valid landline — bare and formatted', () {
      expect(BRValidators.validateLandlinePhone('33333333'), true);
      expect(BRValidators.validateLandlinePhone('3333-3333'), true);
      expect(BRValidators.validateLandlinePhone('21112233'), true);
      expect(BRValidators.validateLandlinePhone('2111-2233'), true);
    });

    test('invalid landline — wrong length', () {
      expect(BRValidators.validateLandlinePhone('123'), false);
      expect(BRValidators.validateLandlinePhone('123456789'), false);
      expect(BRValidators.validateLandlinePhone(''), false);
    });

    test('invalid landline — non-digit characters', () {
      expect(BRValidators.validateLandlinePhone('3333-3A33'), false);
      expect(BRValidators.validateLandlinePhone('1234567A'), false);
    });
  });

  // ── Mobile phone ────────────────────────────────────────────────────────────
  group('Mobile phone validator', () {
    test('valid mobile — 9-digit (no area code)', () {
      expect(BRValidators.validateMobileNumber('999999999'), true);
      expect(BRValidators.validateMobileNumber('99999-9999'), true);
      expect(BRValidators.validateMobileNumber('912345678'), true);
    });

    test('valid mobile — 11-digit (with area code)', () {
      expect(BRValidators.validateMobileNumber('11999999999'), true);
      expect(BRValidators.validateMobileNumber('21899999999'), true);
    });

    test('invalid mobile — wrong length', () {
      expect(BRValidators.validateMobileNumber('9999999'), false);
      expect(BRValidators.validateMobileNumber('9999999999'), false);  // 10 digits
      expect(BRValidators.validateMobileNumber('99999-99999'), false); // 10 digits
      expect(BRValidators.validateMobileNumber('99999-999'), false);   // 8 digits
      expect(BRValidators.validateMobileNumber(''), false);
    });

    test('invalid mobile — 9-digit not starting with 9', () {
      expect(BRValidators.validateMobileNumber('819999999'), false);
      expect(BRValidators.validateMobileNumber('719999999'), false);
    });

    test('invalid mobile — 11-digit first mobile digit not 8 or 9', () {
      expect(BRValidators.validateMobileNumber('11799999999'), false);
      expect(BRValidators.validateMobileNumber('11099999999'), false);
    });

    test('invalid mobile — leading space or non-digit', () {
      expect(BRValidators.validateMobileNumber(' 99999999'), false);
      expect(BRValidators.validateMobileNumber('99999-99A9'), false);
    });
  });

  // ── CNH ─────────────────────────────────────────────────────────────────────
  group('CNH validator', () {
    test('valid CNH', () {
      expect(BRValidators.validateCNH('86647296043'), true);
      expect(BRValidators.validateCNH('06846841061'), true);
    });

    test('invalid CNH — wrong check digits', () {
      expect(BRValidators.validateCNH('72445968612'), false);
      expect(BRValidators.validateCNH('06846841064'), false);
    });

    test('invalid CNH — wrong length', () {
      expect(BRValidators.validateCNH('1234567890'), false);
      expect(BRValidators.validateCNH('123456789012'), false);
      expect(BRValidators.validateCNH(''), false);
    });

    test('invalid CNH — all same digit', () {
      for (int d = 0; d <= 9; d++) {
        expect(BRValidators.validateCNH(d.toString() * 11), false,
            reason: 'all-$d CNH must be rejected');
      }
    });
  });

  // ── PIX ─────────────────────────────────────────────────────────────────────
  group('PIX key validator', () {
    test('valid PIX — CPF key', () {
      expect(BRValidators.validatePixKey('12687494003'), true);
      expect(BRValidators.validatePixKey('664.349.810-40'), true);
    });

    test('valid PIX — CNPJ key', () {
      expect(BRValidators.validatePixKey('69.404.688/0001-71'), true);
      expect(BRValidators.validatePixKey('NZK5MGM2000174'), true);
    });

    test('valid PIX — e-mail key', () {
      expect(BRValidators.validatePixKey('user@example.com'), true);
      expect(BRValidators.validatePixKey('nome.sobrenome+tag@empresa.com.br'), true);
      expect(BRValidators.validatePixKey('a@b.co'), true);
    });

    test('valid PIX — phone key (+55...)', () {
      expect(BRValidators.validatePixKey('+5511999999999'), true);  // 11-digit mobile
      expect(BRValidators.validatePixKey('+551133334444'), true);   // 10-digit landline
    });

    test('valid PIX — random UUID v4 key', () {
      expect(BRValidators.validatePixKey('123e4567-e89b-4d3c-a456-426614174000'), true);
      expect(BRValidators.validatePixKey('550e8400-e29b-41d4-a716-446655440000'), true);
      expect(BRValidators.validatePixKey('6ba7b810-9dad-4b49-8f3a-b8a3f6bfeeda'), true);
    });

    test('invalid PIX — empty string', () {
      expect(BRValidators.validatePixKey(''), false);
    });

    test('invalid PIX — phone without +55', () {
      expect(BRValidators.validatePixKey('11999999999'), false);
      expect(BRValidators.validatePixKey('5511999999999'), false);
    });

    test('invalid PIX — malformed e-mail', () {
      expect(BRValidators.validatePixKey('notanemail'), false);
      expect(BRValidators.validatePixKey('@domain.com'), false);
      expect(BRValidators.validatePixKey('user@'), false);
    });

    test('invalid PIX — UUID wrong version (not v4)', () {
      expect(BRValidators.validatePixKey('123e4567-e89b-3d3c-a456-426614174000'), false); // v3
      expect(BRValidators.validatePixKey('123e4567-e89b-5d3c-a456-426614174000'), false); // v5
    });

    test('invalid PIX — random garbage', () {
      expect(BRValidators.validatePixKey('notakey'), false);
      expect(BRValidators.validatePixKey('12345'), false);
    });
  });

  // ── Placa veicular ──────────────────────────────────────────────────────────
  group('Vehicle plate validator', () {
    test('valid legacy plates (LLL-NNNN)', () {
      expect(BRValidators.validateVehiclePlate('ABC-1234'), true);
      expect(BRValidators.validateVehiclePlate('ABC1234'), true);
      expect(BRValidators.validateVehiclePlate('ZZZ9999'), true);
      expect(BRValidators.validateVehiclePlate('aaa-1234'), true); // lowercase OK
    });

    test('valid Mercosul plates (LLL-NLNN)', () {
      expect(BRValidators.validateVehiclePlate('ABC1D23'), true);
      expect(BRValidators.validateVehiclePlate('ABC-1D23'), true);
      expect(BRValidators.validateVehiclePlate('ZZZ9Z99'), true);
      expect(BRValidators.validateVehiclePlate('abc1d23'), true); // lowercase OK
    });

    test('invalid plate — wrong letter/digit pattern', () {
      expect(BRValidators.validateVehiclePlate('AB-1234'), false);    // only 2 letters
      expect(BRValidators.validateVehiclePlate('ABCD1234'), false);   // 4 letters
      expect(BRValidators.validateVehiclePlate('ABC-123'), false);    // only 3 digits
      expect(BRValidators.validateVehiclePlate('1BC-1234'), false);   // starts with digit
      expect(BRValidators.validateVehiclePlate('ABC-12D4'), false);   // digit at pos 4 but not Mercosul
    });

    test('invalid plate — empty or too short', () {
      expect(BRValidators.validateVehiclePlate(''), false);
      expect(BRValidators.validateVehiclePlate('AB1'), false);
    });
  });

  // ── RENAVAM ─────────────────────────────────────────────────────────────────
  group('RENAVAM validator', () {
    test('valid 9-digit RENAVAM', () {
      expect(BRValidators.validateRENAVAM('618116170'), true);
      expect(BRValidators.validateRENAVAM('000000000'), true);
      expect(BRValidators.validateRENAVAM('999999990'), true);
      expect(BRValidators.validateRENAVAM('123456785'), true);
      expect(BRValidators.validateRENAVAM('111111110'), true);
      expect(BRValidators.validateRENAVAM('555555550'), true);
    });

    test('valid 11-digit RENAVAM (2-digit prefix stripped)', () {
      expect(BRValidators.validateRENAVAM('00618116170'), true);
      expect(BRValidators.validateRENAVAM('99123456785'), true);
    });

    test('invalid RENAVAM — wrong check digit', () {
      expect(BRValidators.validateRENAVAM('618116171'), false);
      expect(BRValidators.validateRENAVAM('123456786'), false);
      expect(BRValidators.validateRENAVAM('999999991'), false);
    });

    test('invalid RENAVAM — wrong length', () {
      expect(BRValidators.validateRENAVAM('123'), false);
      expect(BRValidators.validateRENAVAM('1234567890'), false); // 10 digits
      expect(BRValidators.validateRENAVAM(''), false);
    });

    test('invalid RENAVAM — non-digit characters', () {
      expect(BRValidators.validateRENAVAM('12345678A'), false);
    });
  });

  // ── IE ──────────────────────────────────────────────────────────────────────
  group('IE validator', () {
    group('AC', () {
      test('valid', () {
        expect(BRValidators.validateIE('0130000000025', 'AC'), true);
        expect(BRValidators.validateIE('0131234567801', 'AC'), true);
        expect(BRValidators.validateIE('01.300.000.000-25', 'AC'), true); // formatted
      });
      test('invalid — wrong check', () {
        expect(BRValidators.validateIE('0130000000026', 'AC'), false);
      });
      test('invalid — wrong length', () {
        expect(BRValidators.validateIE('013000000002', 'AC'), false);
        expect(BRValidators.validateIE('01300000000250', 'AC'), false);
      });
    });

    group('AL', () {
      test('valid', () {
        expect(BRValidators.validateIE('067123457', 'AL'), true);
        expect(BRValidators.validateIE('123456789', 'AL'), true);
      });
      test('invalid — wrong check', () {
        expect(BRValidators.validateIE('067123456', 'AL'), false);
      });
      test('invalid — wrong length', () {
        expect(BRValidators.validateIE('12345678', 'AL'), false);
      });
    });

    group('AM', () {
      test('valid', () {
        expect(BRValidators.validateIE('051234564', 'AM'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('051234565', 'AM'), false);
        expect(BRValidators.validateIE('05123456', 'AM'), false);
      });
    });

    group('AP', () {
      test('valid', () {
        expect(BRValidators.validateIE('990000001', 'AP'), true);
        expect(BRValidators.validateIE('030123453', 'AP'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('030123452', 'AP'), false);
        expect(BRValidators.validateIE('03012345', 'AP'), false);
      });
    });

    group('BA', () {
      test('valid 8-digit', () {
        expect(BRValidators.validateIE('12345601', 'BA'), true);
        expect(BRValidators.validateIE('98765450', 'BA'), true);
      });
      test('valid 9-digit', () {
        expect(BRValidators.validateIE('123456797', 'BA'), true);
        expect(BRValidators.validateIE('987654349', 'BA'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('12345602', 'BA'), false);
        expect(BRValidators.validateIE('123456798', 'BA'), false);
        expect(BRValidators.validateIE('1234567', 'BA'), false);
        expect(BRValidators.validateIE('1234567890', 'BA'), false);
      });
    });

    group('CE', () {
      test('valid', () {
        expect(BRValidators.validateIE('061234567', 'CE'), true);
        expect(BRValidators.validateIE('069876541', 'CE'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('061234568', 'CE'), false);
        expect(BRValidators.validateIE('06123456', 'CE'), false);
      });
    });

    group('DF', () {
      test('valid', () {
        expect(BRValidators.validateIE('0730000000003', 'DF'), true);
        expect(BRValidators.validateIE('0731234567875', 'DF'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('0730000000004', 'DF'), false);
        expect(BRValidators.validateIE('073000000000', 'DF'), false);
      });
    });

    group('ES', () {
      test('valid', () {
        expect(BRValidators.validateIE('123456789', 'ES'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('123456780', 'ES'), false);
        expect(BRValidators.validateIE('12345678', 'ES'), false);
      });
    });

    group('GO', () {
      test('valid', () {
        expect(BRValidators.validateIE('100000010', 'GO'), true);
        expect(BRValidators.validateIE('100000002', 'GO'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('100000011', 'GO'), false);
        expect(BRValidators.validateIE('10000001', 'GO'), false);
      });
    });

    group('MA', () {
      test('valid', () {
        expect(BRValidators.validateIE('121234568', 'MA'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('121234569', 'MA'), false);
        expect(BRValidators.validateIE('12123456', 'MA'), false);
      });
    });

    group('MG', () {
      test('valid', () {
        expect(BRValidators.validateIE('0623079040081', 'MG'), true);
        expect(BRValidators.validateIE('0000000000000', 'MG'), true);
        expect(BRValidators.validateIE('1234567891243', 'MG'), true);
      });
      test('invalid — wrong check', () {
        expect(BRValidators.validateIE('0623079040082', 'MG'), false);
        expect(BRValidators.validateIE('0623079040080', 'MG'), false);
      });
      test('invalid — wrong length', () {
        expect(BRValidators.validateIE('062307904008', 'MG'), false);
        expect(BRValidators.validateIE('06230790400810', 'MG'), false);
      });
    });

    group('MS', () {
      test('valid', () {
        expect(BRValidators.validateIE('281234566', 'MS'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('281234567', 'MS'), false);
        expect(BRValidators.validateIE('28123456', 'MS'), false);
      });
    });

    group('MT', () {
      test('valid', () {
        expect(BRValidators.validateIE('13000000002', 'MT'), true);
        expect(BRValidators.validateIE('13987654324', 'MT'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('13000000003', 'MT'), false);
        expect(BRValidators.validateIE('1300000000', 'MT'), false);
      });
    });

    group('PA', () {
      test('valid', () {
        expect(BRValidators.validateIE('151234566', 'PA'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('151234567', 'PA'), false);
        expect(BRValidators.validateIE('15123456', 'PA'), false);
      });
    });

    group('PB', () {
      test('valid', () {
        expect(BRValidators.validateIE('061234567', 'PB'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('061234568', 'PB'), false);
        expect(BRValidators.validateIE('06123456', 'PB'), false);
      });
    });

    group('PE', () {
      test('valid', () {
        expect(BRValidators.validateIE('181234572', 'PE'), true);
        expect(BRValidators.validateIE('189876565', 'PE'), true);
      });
      test('invalid — wrong check digits', () {
        expect(BRValidators.validateIE('181234573', 'PE'), false);
        expect(BRValidators.validateIE('181234570', 'PE'), false);
      });
      test('invalid — wrong length', () {
        expect(BRValidators.validateIE('18123457', 'PE'), false);
        expect(BRValidators.validateIE('1812345720', 'PE'), false);
      });
    });

    group('PI', () {
      test('valid', () {
        expect(BRValidators.validateIE('191234567', 'PI'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('191234568', 'PI'), false);
        expect(BRValidators.validateIE('19123456', 'PI'), false);
      });
    });

    group('PR', () {
      test('valid', () {
        expect(BRValidators.validateIE('9876543273', 'PR'), true);
      });
      test('invalid — wrong check', () {
        expect(BRValidators.validateIE('9876543274', 'PR'), false);
        expect(BRValidators.validateIE('9876543270', 'PR'), false);
      });
      test('invalid — wrong length', () {
        expect(BRValidators.validateIE('987654327', 'PR'), false);
        expect(BRValidators.validateIE('98765432730', 'PR'), false);
      });
    });

    group('RJ', () {
      test('valid', () {
        expect(BRValidators.validateIE('12345674', 'RJ'), true);
        expect(BRValidators.validateIE('76543216', 'RJ'), true);
      });
      test('invalid — wrong check', () {
        expect(BRValidators.validateIE('12345675', 'RJ'), false);
        expect(BRValidators.validateIE('12345670', 'RJ'), false);
      });
      test('invalid — wrong length', () {
        expect(BRValidators.validateIE('1234567', 'RJ'), false);
        expect(BRValidators.validateIE('123456740', 'RJ'), false);
      });
    });

    group('RN', () {
      test('valid 9-digit', () {
        expect(BRValidators.validateIE('200000012', 'RN'), true);
      });
      test('valid 10-digit', () {
        expect(BRValidators.validateIE('2000000002', 'RN'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('200000013', 'RN'), false);
        expect(BRValidators.validateIE('20000001', 'RN'), false);
        expect(BRValidators.validateIE('20000000020', 'RN'), false);
      });
    });

    group('RO', () {
      test('valid', () {
        expect(BRValidators.validateIE('00000000000000', 'RO'), true);
        expect(BRValidators.validateIE('12345678912348', 'RO'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('00000000000001', 'RO'), false);
        expect(BRValidators.validateIE('0000000000000', 'RO'), false);
        expect(BRValidators.validateIE('000000000000000', 'RO'), false);
      });
    });

    group('RR', () {
      test('valid', () {
        expect(BRValidators.validateIE('240000013', 'RR'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('240000014', 'RR'), false);
        expect(BRValidators.validateIE('24000001', 'RR'), false);
      });
    });

    group('RS', () {
      test('valid', () {
        expect(BRValidators.validateIE('1000000009', 'RS'), true);
        expect(BRValidators.validateIE('4271768803', 'RS'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('1000000008', 'RS'), false);
        expect(BRValidators.validateIE('100000000', 'RS'), false);
      });
    });

    group('SC', () {
      test('valid', () {
        expect(BRValidators.validateIE('250000016', 'SC'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('250000017', 'SC'), false);
        expect(BRValidators.validateIE('25000001', 'SC'), false);
      });
    });

    group('SE', () {
      test('valid', () {
        expect(BRValidators.validateIE('270000011', 'SE'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('270000012', 'SE'), false);
        expect(BRValidators.validateIE('27000001', 'SE'), false);
      });
    });

    group('SP', () {
      test('valid', () {
        expect(BRValidators.validateIE('100000000008', 'SP'), true);
        expect(BRValidators.validateIE('251234560785', 'SP'), true);
        expect(BRValidators.validateIE('101111113014', 'SP'), true);
      });
      test('invalid — wrong check', () {
        expect(BRValidators.validateIE('100000000009', 'SP'), false);
        expect(BRValidators.validateIE('251234560786', 'SP'), false);
      });
      test('invalid — wrong length', () {
        expect(BRValidators.validateIE('10000000000', 'SP'), false);
        expect(BRValidators.validateIE('1000000000080', 'SP'), false);
      });
    });

    group('TO', () {
      test('valid', () {
        expect(BRValidators.validateIE('29000000009', 'TO'), true);
        expect(BRValidators.validateIE('29123456783', 'TO'), true);
      });
      test('invalid', () {
        expect(BRValidators.validateIE('29000000008', 'TO'), false);
        expect(BRValidators.validateIE('2900000000', 'TO'), false);
      });
    });

    test('unknown UF returns false', () {
      expect(BRValidators.validateIE('123456789', 'XX'), false);
      expect(BRValidators.validateIE('123456789', ''), false);
      expect(BRValidators.validateIE('123456789', 'BR'), false);
    });

    test('case-insensitive UF', () {
      expect(BRValidators.validateIE('100000000008', 'sp'), true);
      expect(BRValidators.validateIE('100000000008', 'Sp'), true);
    });

    test('formatting stripped before validation', () {
      // SP with mask dots
      expect(BRValidators.validateIE('100.000.000.008', 'SP'), true);
    });
  });

  // ── Título de Eleitor ────────────────────────────────────────────────────────
  group('Título de Eleitor validator', () {
    test('valid — all 28 state codes', () {
      // Generated: seq=18004249, state code varied
      const validTitulos = {
        1:  '200000000176', // SP special rule
        2:  '100000000292', // MG special rule
        3:  '180042490309',
        4:  '180042490401',
        5:  '180042490504',
        6:  '180042490607',
        7:  '180042490700',
        8:  '180042490802',
        9:  '180042490905',
        10: '180042491004',
        11: '180042491107',
        12: '180042491200',
        13: '180042491302',
        14: '180042491405',
        15: '180042491508',
        16: '180042491600',
        17: '180042491703',
        18: '180042491806',
        19: '180042491909',
        20: '180042492008',
        21: '180042492100',
        22: '180042492203',
        23: '180042492306',
        24: '180042492409',
        25: '180042492501',
        26: '180042492604',
        27: '180042492707',
        28: '180042492800',
      };
      for (final entry in validTitulos.entries) {
        expect(BRValidators.validateTituloEleitor(entry.value), true,
            reason: 'state code ${entry.key} should be valid');
      }
    });

    test('valid — with formatting stripped', () {
      expect(BRValidators.validateTituloEleitor('1800 4249 0607'), true);
      expect(BRValidators.validateTituloEleitor('180042490607'), true);
    });

    test('invalid — wrong first check digit', () {
      expect(BRValidators.validateTituloEleitor('180042490608'), false);
      expect(BRValidators.validateTituloEleitor('180042490600'), false);
    });

    test('invalid — wrong second check digit', () {
      expect(BRValidators.validateTituloEleitor('180042490617'), false);
    });

    test('invalid — state code 00 (forbidden)', () {
      expect(BRValidators.validateTituloEleitor('180042490007'), false);
    });

    test('invalid — state code > 28 (forbidden)', () {
      expect(BRValidators.validateTituloEleitor('180042492907'), false);
      expect(BRValidators.validateTituloEleitor('180042499907'), false);
    });

    test('invalid — wrong length', () {
      expect(BRValidators.validateTituloEleitor('18004249060'), false);  // 11 digits
      expect(BRValidators.validateTituloEleitor('1800424906070'), false); // 13 digits
      expect(BRValidators.validateTituloEleitor(''), false);
    });

    test('invalid — non-digit characters', () {
      expect(BRValidators.validateTituloEleitor('1800424906A7'), false);
    });
  });

  // ── IBAN ─────────────────────────────────────────────────────────────────────
  group('IBAN validator', () {
    test('valid IBANs (mod-97 == 1)', () {
      expect(BRValidators.validateIBAN('BR6100000000000010123456789C1'), true);
      expect(BRValidators.validateIBAN('BR4700000000000010000000001P2'), true);
      expect(BRValidators.validateIBAN('BR0634171400000010123456789C1'), true);
      expect(BRValidators.validateIBAN('BR4600000000000019999999999C1'), true);
    });

    test('valid IBAN — spaces stripped', () {
      expect(BRValidators.validateIBAN('BR61 00000000 00001 0123456789 C 1'), true);
      expect(BRValidators.validateIBAN('BR47 00000000 00001 0000000001 P 2'), true);
    });

    test('invalid IBAN — wrong check digits', () {
      expect(BRValidators.validateIBAN('BR0000000000000010123456789C1'), false);
      expect(BRValidators.validateIBAN('BR9900000000000010123456789C1'), false);
    });

    test('invalid IBAN — not Brazilian (wrong country code)', () {
      expect(BRValidators.validateIBAN('GB82WEST12345698765432'), false);
      expect(BRValidators.validateIBAN('DE89370400440532013000'), false);
    });

    test('invalid IBAN — wrong length', () {
      expect(BRValidators.validateIBAN('BR6100000000000010123456789C'), false);   // 28
      expect(BRValidators.validateIBAN('BR6100000000000010123456789C10'), false); // 30
      expect(BRValidators.validateIBAN(''), false);
    });

    test('invalid IBAN — wrong format (letters in wrong positions)', () {
      expect(BRValidators.validateIBAN('BR6100000000000010123456789CC'), false);
      expect(BRValidators.validateIBAN('BR610000000000001012345678911'), false);
    });
  });

  // ── Passaporte ───────────────────────────────────────────────────────────────
  group('Passport validator', () {
    test('valid passports (LL######)', () {
      expect(BRValidators.validatePassport('AB123456'), true);
      expect(BRValidators.validatePassport('ZZ999999'), true);
      expect(BRValidators.validatePassport('AA000000'), true);
      expect(BRValidators.validatePassport('MZ654321'), true);
    });

    test('valid passport — lowercase accepted', () {
      expect(BRValidators.validatePassport('ab123456'), true);
      expect(BRValidators.validatePassport('Ab123456'), true);
    });

    test('invalid passport — wrong letter count', () {
      expect(BRValidators.validatePassport('A1234567'), false);  // 1 letter
      expect(BRValidators.validatePassport('ABC12345'), false);  // 3 letters
    });

    test('invalid passport — wrong digit count', () {
      expect(BRValidators.validatePassport('AB12345'), false);   // 5 digits
      expect(BRValidators.validatePassport('AB1234567'), false); // 7 digits
    });

    test('invalid passport — empty', () {
      expect(BRValidators.validatePassport(''), false);
    });

    test('invalid passport — digits before letters', () {
      expect(BRValidators.validatePassport('12AB3456'), false);
      expect(BRValidators.validatePassport('123456AB'), false);
    });
  });

  // ── UF ──────────────────────────────────────────────────────────────────────
  group('UF validator', () {
    test('all 27 valid UFs — uppercase', () {
      const validUFs = [
        'AC','AL','AM','AP','BA','CE','DF','ES','GO','MA',
        'MG','MS','MT','PA','PB','PE','PI','PR','RJ','RN',
        'RO','RR','RS','SC','SE','SP','TO',
      ];
      for (final uf in validUFs) {
        expect(BRValidators.validateUF(uf), true, reason: '$uf should be valid');
      }
    });

    test('all 27 valid UFs — lowercase accepted', () {
      const validUFs = [
        'ac','al','am','ap','ba','ce','df','es','go','ma',
        'mg','ms','mt','pa','pb','pe','pi','pr','rj','rn',
        'ro','rr','rs','sc','se','sp','to',
      ];
      for (final uf in validUFs) {
        expect(BRValidators.validateUF(uf), true, reason: '$uf lowercase should be valid');
      }
    });

    test('invalid UFs — non-existent codes', () {
      for (final uf in ['XX','BR','EU','US','00','AB','ZZ','AA']) {
        expect(BRValidators.validateUF(uf), false, reason: '$uf should be invalid');
      }
    });

    test('invalid UF — empty or wrong length', () {
      expect(BRValidators.validateUF(''), false);
      expect(BRValidators.validateUF('S'), false);
      expect(BRValidators.validateUF('SPP'), false);
    });

    test('valid UF — with whitespace stripped', () {
      expect(BRValidators.validateUF(' SP'), true);
      expect(BRValidators.validateUF('SP '), true);
    });
  });

  // ── NUP ─────────────────────────────────────────────────────────────────────
  group('NUP validator', () {
    test('valid NUPs', () {
      expect(BRValidators.validateNUP('00000.000001/2023-05'), true);
      expect(BRValidators.validateNUP('00001.000001/2024-00'), true);
      expect(BRValidators.validateNUP('12345.000001/2025-09'), true);
      expect(BRValidators.validateNUP('99999.999990/2026-02'), true);
      expect(BRValidators.validateNUP('00000.000000/2020-06'), true);
      expect(BRValidators.validateNUP('00000.000000/9999-06'), true);
    });

    test('valid NUP — bare digits (no formatting)', () {
      expect(BRValidators.validateNUP('00000000001202305'), true);
      expect(BRValidators.validateNUP('00001000001202400'), true);
    });

    test('invalid NUP — wrong check digits', () {
      expect(BRValidators.validateNUP('00000.000001/2023-99'), false);
      expect(BRValidators.validateNUP('00000.000001/2023-07'), false);
      expect(BRValidators.validateNUP('00000.000001/2023-00'), false);
    });

    test('invalid NUP — wrong length', () {
      expect(BRValidators.validateNUP('123'), false);
      expect(BRValidators.validateNUP('0000000000120230'), false);   // 16 digits
      expect(BRValidators.validateNUP('000000000012023050'), false); // 18 digits
      expect(BRValidators.validateNUP(''), false);
    });

    test('invalid NUP — non-digit characters', () {
      expect(BRValidators.validateNUP('0000A.000001/2023-05'), false);
    });
  });
}
