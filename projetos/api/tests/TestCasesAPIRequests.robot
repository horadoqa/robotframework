*** Settings ***
Documentation       Suíte de Exemplo de testes API com o Robot Framework
Resource            ../resources/BDDImplementation.robot

*** Test Cases ***
Cenário 01: Consulta de endereço existente
    [Tags]  jenkins
    Dado que esteja conectado no webservice de consultas de CEP
    Quando o usuário consultar o CEP "25620160"
    Então deve ser mostrado o endereço "Rua General Osório"
    E deve ser mostrado o bairro "Centro"
    E deve ser mostrada a cidade "Petrópolis"
    E deve ser mostrada a UF "RJ"
    E deve ser mostrado o CEP "25620160"

Cenário 02: Consulta de endereço inexistente
    Dado que esteja conectado no webservice de consultas de CEP
    Quando o usuário consultar o CEP "99999-999"
    Então a mensagem "CEP INVÁLIDO" deve ser retornada