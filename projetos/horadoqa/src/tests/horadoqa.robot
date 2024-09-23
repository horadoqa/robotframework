*** Settings ***
Library  SeleniumLibrary


*** Variables ***

${url}    http://127.0.0.1:5500/site/index.html
${frameworks}    //*[@id="select-itens"]/option[3]
${verificação}    //h1[contains(text(), "Thank you for your participation!")]


*** Keywords ***
Given que o usuário acessou o site
    Open Browser    ${url}    chrome

And escolheu um item da lista de frameworks
    Click Element    ${frameworks}

And digitou algo sobre a escolha
    Input Text    //*[@id="area"]    text=Robot Framework is an open source automation framework for test automation and robotic process automation (RPA).
    Sleep    5s

And inseriu os dados pessoais
    Input Text    //*[@id="name"]    Ricardo Fahham
    Input Text    //*[@id="email"]    rfahham@hotmail.com
    Input Text    //*[@id="phone"]    21982227843
    Sleep    5s

And informou o país de origem
    Click Element   //*[@id="country"]/option[4]
    Sleep    5s

And clicar em "Send"
    Click Element    //*[@id="submit-button"]

And a mensagem de confirmação será exibida
    Wait Until Element Is Visible    ${verificação}    10
    Element Should Be Visible    ${verificação}
    Sleep    5s

Then o site será fechado
    Close Browser


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
