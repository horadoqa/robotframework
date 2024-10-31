*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${QUANTIDADE}    3
${url}           https://horadoqa.github.io/site/testes/index.html
${frameworks}    //*[@id="select-itens"]/option[3]
${text}          //*[@id="area"]    
${nome}          //*[@id="name"]    
${e-mail}        //*[@id="email"]    
${telefone}      //*[@id="phone"]    
${país}          //*[@id="country"]/option[4]
${button}        //*[@id="submit-button"]
${verificação}   //h1[contains(text(),"Bem-vindo")]


*** Keywords ***
Cadastrar Usuário
    Given que o usuário acessou o site
    And escolheu um item da lista de frameworks
    And digitou algo sobre a escolha
    And inseriu os dados pessoais
    And informou o país de origem
    And clicar em "Enviar"
    And a mensagem de confirmação será exibida

Given que o usuário acessou o site
    Open Browser    ${url}    chrome

And escolheu um item da lista de frameworks
    Click Element    ${frameworks}

And digitou algo sobre a escolha
    Input Text    ${text}    Robot Framework é uma ferramenta de automação.

And inseriu os dados pessoais
    Input Text    ${nome}    Hora do QA
    Input Text    ${e-mail}    horadoqa@gmail.com
    Input Text    ${telefone}    219876543210
    Sleep    3s

And informou o país de origem
    Click Element    ${país}

And clicar em "Enviar"
    Click Element    ${button}

And a mensagem de confirmação será exibida
    Wait Until Element Is Visible    ${verificação}    timeout=10
    Element Should Be Visible    ${verificação}

Then o site será fechado
    Close Browser
