*** Settings ***
Resource    keywords.resource


*** Test Cases ***
Cenário1: Enviar dados pelo site
    Given que o usuário acessou o site
    And escolheu um item da lista de frameworks
    And digitou algo sobre a escolha
    And inseriu os dados pessoais
    And informou o país de origem
    And clicar em "Send"
    And a mensagem de confirmação será exibida
    Then o site será fechado

# Cenário: Enviar dados pelo site
#     Dado que o usuário acessou o site
#     E escolheu um item da lista de frameworks
#     E digitou algo sobre a escolha
#     E inseriu os dados pessoais
#     E informou o país de origem
#     Quando clicar em "Send"
#     E a mensagem de confirmação será exibida
#     Então o site será fechado