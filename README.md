# BRValidators

Pacote Dart/Flutter com validadores e máscaras de entrada para documentos e dados brasileiros.

## Instalação

```yaml
dependencies:
  br_validators: ^3.1.0
```

```bash
flutter pub get
```

## Uso

```dart
import 'package:br_validators/br_validators.dart';
```

---

## Validadores

### CPF

```dart
BRValidators.validateCPF('123.456.789-09'); // true
BRValidators.validateCPF('111.111.111-11'); // false — sequência repetida
```

### CNPJ (alfanumérico — IN RFB 2.229/2024)

Aceita CNPJ numérico clássico e o novo formato alfanumérico onde as 12 posições base admitem letras A–Z.

```dart
BRValidators.validateCNPJ('11.222.333/0001-81'); // true
BRValidators.validateCNPJ('12.ABC.345/0001-88'); // true — alfanumérico
```

### PIS/PASEP

```dart
BRValidators.validatePISPASEP('123.45678.90-1'); // true
```

### CEP

```dart
BRValidators.validateCEP('01310-100'); // true
```

### Telefone fixo

```dart
BRValidators.validateLandlinePhone('(11) 3456-7890'); // true
```

### Celular

```dart
BRValidators.validateMobileNumber('(11) 91234-5678'); // true
```

### Telefone genérico (fixo ou celular)

```dart
BRValidators.validatePhoneNumber('(11) 91234-5678'); // true
```

### CNH

```dart
BRValidators.validateCNH('12345678909'); // true
BRValidators.validateCNH('00000000000'); // false — sequência repetida
```

### Chave PIX

Aceita CPF, CNPJ, e-mail, telefone (`+55` seguido de 10 ou 11 dígitos) e chave aleatória (UUID v4).

```dart
BRValidators.validatePixKey('123.456.789-09');                                 // CPF
BRValidators.validatePixKey('user@email.com');                                 // e-mail
BRValidators.validatePixKey('+5511999999999');                                 // celular
BRValidators.validatePixKey('550e8400-e29b-41d4-a716-446655440000');           // UUID v4
```

### Placa veicular

Aceita formato legado (`ABC-1234`) e Mercosul (`ABC1D23`).

```dart
BRValidators.validateVehiclePlate('ABC-1234'); // true — legado
BRValidators.validateVehiclePlate('ABC1D23');  // true — Mercosul
```

### RENAVAM

Aceita 9 ou 11 dígitos (com ou sem prefixo de 2 dígitos).

```dart
BRValidators.validateRENAVAM('123456789');    // 9 dígitos
BRValidators.validateRENAVAM('00123456789'); // 11 dígitos
```

### Inscrição Estadual (IE)

Valida a IE de qualquer um dos 27 estados + DF com o algoritmo de dígito verificador específico de cada UF.

```dart
BRValidators.validateIE('062.307.904.0081', 'MG'); // true
BRValidators.validateIE('110.042.490.114',  'SP'); // true
BRValidators.validateIE('12345678',         'RJ'); // false
```

### Título de Eleitor

```dart
BRValidators.validateTituloEleitor('180042490607'); // true
BRValidators.validateTituloEleitor('000000000000'); // false
```

### IBAN Brasil

Formato: `BRkk BBBBB SSSSS CCCCCCCCCC T N` (29 caracteres sem espaços).  
Valida via algoritmo ISO 13616 (mod 97).

```dart
BRValidators.validateIBAN('BR1500000000000010932840814P2'); // true
BRValidators.validateIBAN('BR61 00360305 00001U2550014P4'); // true — espaços ignorados
```

### Passaporte brasileiro

Formato: 2 letras seguidas de 6 dígitos.

```dart
BRValidators.validatePassport('AA123456'); // true
BRValidators.validatePassport('ab654321'); // true — aceita minúsculas
```

### UF

```dart
BRValidators.validateUF('SP'); // true
BRValidators.validateUF('sp'); // true — case-insensitive
BRValidators.validateUF('XX'); // false
```

### NUP (Número Único de Protocolo)

Formato: `OOOOO.SSSSSS/AAAA-DD` — validado com módulo 11.

```dart
BRValidators.validateNUP('00000.000001/2023-05'); // true
BRValidators.validateNUP('00000000012023-05');    // true — sem formatação
```

---

## Máscaras

As máscaras são `TextInputFormatter` prontos para usar em `TextField`.

| Máscara | Atributo | Formato |
|---|---|---|
| CPF | `BRMasks.cpf` | `###.###.###-##` |
| CNPJ | `BRMasks.cnpj` | `@@.@@@.@@@/@@@@-##` |
| CEP | `BRMasks.cep` | `#####-###` |
| CNH | `BRMasks.cnh` | `###########` |
| Celular | `BRMasks.mobilePhone` | `(##) #####-####` |
| Telefone fixo | `BRMasks.landlinePhone` | `(##) ####-####` |
| PIS/PASEP | `BRMasks.pisPasep` | `###.#####.##-#` |
| Data | `BRMasks.date` | `##/##/####` |
| Placa legado | `BRMasks.vehiclePlateLegacy` | `@@@-####` |
| Placa Mercosul | `BRMasks.vehiclePlateMercosul` | `@@@#@##` |
| RENAVAM | `BRMasks.renavam` | `###########` |
| IE genérica | `BRMasks.ie` | `###.###.###.###` |
| Título de Eleitor | `BRMasks.tituloEleitor` | `#### #### ####` |
| IBAN | `BRMasks.iban` | `BR## ##### ##### ##########@#` |
| Passaporte | `BRMasks.passport` | `@@######` |
| NUP | `BRMasks.nup` | `#####.######/####-##` |

> `#` aceita apenas dígitos `[0-9]`. `@` aceita letras e dígitos `[A-Za-z0-9]`.

### Exemplo de uso com TextField

```dart
TextField(
  inputFormatters: [BRMasks.cpf],
  decoration: const InputDecoration(labelText: 'CPF'),
),

TextField(
  inputFormatters: [BRMasks.cnpj],
  decoration: const InputDecoration(labelText: 'CNPJ'),
),
```

---

## Contribuindo

Contribuições são bem-vindas! Abra uma issue ou PR no [repositório GitHub](https://github.com/Natanlimap/br_validators).

## Licença

MIT — consulte o arquivo [LICENSE](LICENSE).
