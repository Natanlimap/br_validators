import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/// Class containing mask patterns for Brazilian documents.
class BRMasks {
  /// Mask for CPF: `###.###.###-##`
  static final cpf = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  /// Mask for CEP: `#####-###`
  static final cep = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {'#': RegExp(r'[0-9]')},
  );

  /// Mask for CNH: `###########`
  static final cnh = MaskTextInputFormatter(
    mask: '###########',
    filter: {'#': RegExp(r'[0-9]')},
  );

  /// Mask for CNPJ (alphanumeric, IN RFB 2.229/2024): `@@.@@@.@@@/@@@@-##`
  static final cnpj = MaskTextInputFormatter(
    mask: '@@.@@@.@@@/@@@@-##',
    filter: {
      '@': RegExp(r'[A-Za-z0-9]'),
      '#': RegExp(r'[0-9]'),
    },
  );

  /// Mask for mobile phone: `(##) #####-####`
  static final mobilePhone = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  /// Mask for landline phone: `(##) ####-####`
  static final landlinePhone = MaskTextInputFormatter(
    mask: '(##) ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  /// Mask for PIS/PASEP: `###.#####.##-#`
  static final pisPasep = MaskTextInputFormatter(
    mask: '###.#####.##-#',
    filter: {'#': RegExp(r'[0-9]')},
  );

  /// Mask for date: `##/##/####`
  static final date = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  /// Mask for legacy vehicle plate: `@@@-####`
  static final vehiclePlateLegacy = MaskTextInputFormatter(
    mask: '@@@-####',
    filter: {
      '@': RegExp(r'[A-Za-z]'),
      '#': RegExp(r'[0-9]'),
    },
  );

  /// Mask for Mercosul vehicle plate: `@@@#@##`
  static final vehiclePlateMercosul = MaskTextInputFormatter(
    mask: '@@@#@##',
    filter: {
      '@': RegExp(r'[A-Za-z]'),
      '#': RegExp(r'[0-9]'),
    },
  );

  /// Mask for RENAVAM: `###########`
  static final renavam = MaskTextInputFormatter(
    mask: '###########',
    filter: {'#': RegExp(r'[0-9]')},
  );

  /// Mask for Inscrição Estadual (generic 12-digit format): `###.###.###.###`
  static final ie = MaskTextInputFormatter(
    mask: '###.###.###.###',
    filter: {'#': RegExp(r'[0-9]')},
  );

  /// Mask for Título de Eleitor: `#### #### ####`
  static final tituloEleitor = MaskTextInputFormatter(
    mask: '#### #### ####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  /// Mask for Brazilian IBAN: `BR## ##### ##### ########## @ #`
  static final iban = MaskTextInputFormatter(
    mask: 'BR## ##### ##### ##########@#',
    filter: {
      '#': RegExp(r'[0-9]'),
      '@': RegExp(r'[A-Za-z]'),
    },
  );

  /// Mask for Brazilian passport: `@@######`
  static final passport = MaskTextInputFormatter(
    mask: '@@######',
    filter: {
      '@': RegExp(r'[A-Za-z]'),
      '#': RegExp(r'[0-9]'),
    },
  );

  /// Mask for NUP (Número Único de Protocolo): `#####.######/####-##`
  static final nup = MaskTextInputFormatter(
    mask: '#####.######/####-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
}
