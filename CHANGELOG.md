Claro! Com base na adição que você fez, seu changelog atualizado ficaria assim:

# Changelog

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

- Implementação inicial do pacote BRValidators.
- Validação de CPF com o método `BRValidators.validateCPF`.
- Validação de CNPJ com o método `BRValidators.validateCNPJ`.
- Validação de PIS/PASEP com o método `BRValidators.validatePISPASEP`.
- Validação de CEP com o método `BRValidators.validateCEP`.
- Validação de telefone fixo com o método `BRValidators.validateLandlinePhone`.
- Validação de número de celular com o método `BRValidators.validateMobileNumber`.
- Validação de número de telefone genérico (pode ser fixo ou móvel) com o método `BRValidators.validatePhoneNumber`.
- Validação de CNH com o método `BRValidators.validateCNH`.
