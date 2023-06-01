import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/// Class containing mask patterns for Brazilian documents.
class BRMasks {
  /// Mask pattern for CPF (Individual Taxpayer Registry) numbers.
  static final cpf = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  /// Mask pattern for CEP (Postal Code) numbers.
  static final cep = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
  );

  /// Mask pattern for CNH (National Driver's License) numbers.
  static final cnh = MaskTextInputFormatter(
    mask: '###########',
    filter: {"#": RegExp(r'[0-9]')},
  );

  /// Mask pattern for CNPJ (National Registry of Legal Entities) numbers.
  static final cnpj = MaskTextInputFormatter(
    mask: '##.###.###/####-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  /// Mask pattern for celular (mobile phone) numbers.
  static final celular = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  /// Mask pattern for telefoneFixo (landline phone) numbers.
  static final telefoneFixo = MaskTextInputFormatter(
    mask: '(##) ####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  /// Mask pattern for PIS/PASEP (Social Integration Program/Program for the Formation of Public Servers) numbers.
  static final pisPasep = MaskTextInputFormatter(
    mask: '###.#####.##-#',
    filter: {"#": RegExp(r'[0-9]')},
  );

  /// Mask pattern for date (DD/MM/YYYY) format.
  static final data = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
  );
}
