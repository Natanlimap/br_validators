# Changelog

## [3.1.2]

### Corrigido

- **CNPJ alfanumérico**: resolvidos conflitos de merge nos testes mantendo os casos válidos conforme o cálculo oficial `ASCII - 48`.
- **Documentação**: corrigido exemplo de CNPJ alfanumérico no README para usar dígitos verificadores válidos.

## [3.1.1]

### Corrigido

- **CNPJ alfanumérico**: Corrigido o cálculo numérico dos caracteres alfanuméricos para aderir corretamente às normas definidas pela IN RFB 2.229/2024 (cálculo pela tabela ASCII `ord(char) - 48`).

## [3.1.0]

### Adicionado

- **Chave PIX** (`validatePixKey`): valida os 5 tipos de chave definidos pelo Banco Central — CPF, CNPJ, e-mail, telefone (`+55…`) e chave aleatória (UUID v4). Máscara: nenhuma (formato variável).
- **Placa veicular** (`validateVehiclePlate`): aceita formato legado (`ABC-1234`) e Mercosul (`ABC1D23`). Máscaras: `BRMasks.vehiclePlateLegacy` e `BRMasks.vehiclePlateMercosul`.
- **RENAVAM** (`validateRENAVAM`): valida 9 ou 11 dígitos com dígito verificador módulo 11. Máscara: `BRMasks.renavam`.
- **Inscrição Estadual** (`validateIE(ie, uf)`): validação completa para os 27 estados + DF, cada um com seu próprio algoritmo de dígito verificador. Máscara genérica: `BRMasks.ie`.
- **Título de Eleitor** (`validateTituloEleitor`): valida 12 dígitos com dois dígitos verificadores e código de estado (01–28), incluindo regras especiais para SP e MG. Máscara: `BRMasks.tituloEleitor`.
- **IBAN Brasil** (`validateIBAN`): valida o formato `BRkk BBBBB SSSSS CCCCCCCCCC T N` (29 chars) via algoritmo ISO 13616 mod-97. Máscara: `BRMasks.iban`.
- **Passaporte brasileiro** (`validatePassport`): valida formato `AA######` (2 letras + 6 dígitos). Máscara: `BRMasks.passport`.
- **UF** (`validateUF`): valida se a sigla é uma das 27 UFs brasileiras válidas (case-insensitive).
- **NUP** (`validateNUP`): valida o Número Único de Protocolo governamental `OOOOO.SSSSSS/AAAA-DD` com dígito verificador módulo 11. Máscara: `BRMasks.nup`.

## [3.0.0]

### Alterado (breaking)

- **CNPJ alfanumérico**: validador e máscara agora suportam o formato alfanumérico definido pela IN RFB 2.229/2024. Letras A–Z (maiúsculas/minúsculas) são aceitas nas 12 posições base; os 2 dígitos verificadores continuam numéricos.
- **CPF**: rejeita sequências com todos os dígitos iguais (ex.: `111.111.111-11`), que nunca foram CPFs válidos.
- **CNH**: rejeita sequências com todos os dígitos iguais (ex.: `00000000000`).
- **Máscara CNPJ** (`BRMasks.cnpj`): caractere `@` agora aceita `[A-Za-z0-9]` e `#` apenas `[0-9]` (dois últimos dígitos verificadores). Atualização necessária em qualquer código que dependia do filtro anterior.
- `pubspec.yaml`: SDK constraint ampliada para `<4.0.0`.

## [2.0.3]

- Alterado documentação

## [2.0.2]

- Alterado a library da classe BRValidators para remover conflito


## [2.0.0]

Para manter o padrão do código, renomeei o nome das variáveis para inglês.

### Alterado

- Renomeado `BRMasks.celular`para `BRMasks.mobilePhone`
- Renomeado `BRMasks.telefoneFixo`para `BRMasks.landlinePhone`
- Renomeado `BRMasks.data`para `BRMasks.date`

## [1.1.0]

### Adicionado

- Classe `BRMasks` para formatar inputs com máscaras.
- Máscara de CPF na classe `BRMasks` com o atributo `BRMasks.cpf`.
- Máscara de CEP na classe `BRMasks` com o atributo `BRMasks.cep`.
- Máscara de CNH na classe `BRMasks` com o atributo `BRMasks.cnh`.
- Máscara de CNPJ na classe `BRMasks` com o atributo `BRMasks.cnpj`.
- Máscara de celular na classe `BRMasks` com o atributo `BRMasks.celular`.
- Máscara de telefone fixo na classe `BRMasks` com o atributo `BRMasks.telefoneFixo`.
- Máscara de PIS/PASEP na classe `BRMasks` com o atributo `BRMasks.pisPasep`.
- Máscara de data na classe `BRMasks` com o atributo `BRMasks.data`.

## [1.0.0]

### Adicionado

- Implementação inicial do pacote BRValidator.
- Validação de CPF com o método `BRValidator.validateCPF`.
- Validação de CNPJ com o método `BRValidator.validateCNPJ`.
- Validação de PIS/PASEP com o método `BRValidator.validatePISPASEP`.
- Validação de CEP com o método `BRValidator.validateCEP`.
- Validação de telefone fixo com o método `BRValidator.validateLandlinePhone`.
- Validação de número de celular com o método `BRValidator.validateMobileNumber`.
- Validação de número de telefone genérico (pode ser fixo ou móvel) com o método `BRValidator.validatePhoneNumber`.
- Validação de CNH com o método `BRValidator.validateCNH`.
