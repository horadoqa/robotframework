*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String

*** Variables ***
${URL}    http://127.0.0.1:5501/projetos/horadoqa/src/fe/index.html
${frameworks}    //*[@id="select-itens"]/option[3]
${verificação}    //h1[contains(text(), "Obrigado por sua participação !!!")]

*** Keywords ***
Given que o usuário acessou o site
    Open Browser    ${URL}    chrome

And escolheu um item da lista de frameworks
    Click Element    ${frameworks}
    Sleep    5s

And digitou algo sobre a escolha
    Input Text    //*[@id="area"]    text=Robot Framework is an open source automation framework for test automation and robotic process automation (RPA).
    Sleep    5s

And inseriu os dados pessoais
    ${dados} =    Get File    projetos/csv/dados.csv
    @{linhas} =    Split String    ${dados}    \n
    ${linha} =    Get From List    @{linhas}    1  # Pula o cabeçalho
    @{campos} =    Split String    ${linha}    ,
    ${name} =    Get From List    @{campos}    0
    ${email} =    Get From List    @{campos}    1
    ${phone} =    Get From List    @{campos}    2
    Input Text    //*[@id="name"]    ${name}
    Input Text    //*[@id="email"]    ${email}
    Input Text    //*[@id="phone"]    ${phone}

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
    Then o site será fechado
