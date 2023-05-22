# BRValidators

## Descrição

O pacote BRValidators fornece uma série de funções para a validação de diferentes tipos de dados frequentemente usados no Brasil, como CPF, CNPJ, PIS/PASEP, CEP, telefones fixos e móveis, e CNH.

Este pacote é muito útil em muitos cenários diferentes, como em sistemas de cadastro de pessoas ou empresas, sistemas de venda online onde é necessário validar o CEP, ou sistemas de gerenciamento de motoristas onde é necessário validar a CNH.

## Instalação

Para instalar o pacote, adicione a seguinte linha ao arquivo `pubspec.yaml` do seu projeto Dart ou Flutter:

```yaml
dependencies:
  br_validators: ^latest_version
```

Não esqueça de substituir `latest_version` pela versão atual do pacote.

Em seguida, execute o comando `flutter pub get` (para projetos Flutter) ou `pub get` (para projetos Dart puros) para baixar e instalar o pacote.

## Como usar

Para usar as funções de validação fornecidas pelo pacote, primeiro importe o pacote no seu código:

```dart
import 'package:br_validators/br_validators.dart';
```

Em seguida, você pode usar as funções de validação. Aqui estão alguns exemplos:

```dart
bool isValidCPF = BRValidators.validateCPF('123.456.789-09');
bool isValidCNPJ = BRValidators.validateCNPJ('12.345.678/0001-95');
bool isValidPISPASEP = BRValidators.validatePISPASEP('123.45678.90-1');
bool isValidCEP = BRValidators.validateCEP('12345-678');
bool isValidLandlinePhone = BRValidators.validateLandlinePhone('(11) 1234-5678');
bool isValidMobileNumber = BRValidators.validateMobileNumber('(11) 91234-5678');
bool isValidPhoneNumber = BRValidators.validatePhoneNumber('(11) 91234-5678');
bool isValidCNH = BRValidators.validateCNH('12345678909');
```

Cada função de validação retornará `true` se o valor fornecido for válido, ou `false` se não for válido.

## Contribuindo

Contribuições são bem-vindas! Se você encontrar um bug ou tiver uma sugestão de melhoria, por favor abra uma issue no nosso repositório GitHub.

## Licença

Este pacote é licenciado sob a licença MIT. Consulte o arquivo LICENSE para mais detalhes.
