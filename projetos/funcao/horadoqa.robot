*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary      locale=pt_Br

*** Variables ***
${url}    http://127.0.0.1:5501/projetos/horadoqa/src/fe/index.html
${frameworks}    //*[@id="select-itens"]/option[3]
${verificação}    //h1[contains(text(), "Obrigado por sua participação !!!")]



*** Keywords ***
Given que o usuário acessou o site
    Open Browser    ${url}    chrome

And escolheu um item da lista de frameworks
    Click Element    ${frameworks}
    Sleep    5s

And digitou algo sobre a escolha
    Input Text    //*[@id="area"]    text=Robot Framework is an open source automation framework for test automation and robotic process automation (RPA).
    Sleep    5s

And inseriu os dados pessoais
    Input Text    //*[@id="name"]    ${words}=    FakerLibrary.Words
    Input Text    //*[@id="email"]    ${EMAIL}=  FakerLibrary.Email
    Input Text    //*[@id="phone"]    ${PHONE}= FakerLibrary.Phone

And informou o país de origem
    Click Element   //*[@id="country"]/option[4]
    Sleep    5s

And clicar em "Enviar"
    Click Element    //*[@id="submitButton"]
    Sleep    5s

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
    And clicar em "Enviar"
    And a mensagem de confirmação será exibida
    Then o site será fechado
