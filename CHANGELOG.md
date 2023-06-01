# Changelog

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
