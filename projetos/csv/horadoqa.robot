*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    CSVLibrary

*** Variables ***
${URL}            https://horadoqa.github.io/site/testes/index.html
${path}           projetos/csv/dados.csv
${frameworks}     //*[@id="select-itens"]/option[4]
${text}           Robot Framework is an open source automation framework for test automation and robotic process automation (RPA).
${Button}         //*[@id="submit-button"]
${verificação}    //h1[contains(text(), "Bem-vindo")]
${youtube}        xpath=//a[@class='youtube-button']

*** Keywords ***
Given que o usuário acessou o site
    Open Browser    ${URL}    chrome

And escolheu um item da lista de frameworks
    Click Element    ${frameworks}
    Sleep    5s

And digitou algo sobre a escolha
    Input Text    //*[@id="area"]    ${text}
    Sleep    5s

And inseriu os dados pessoais
    # Lê o arquivo CSV e converte em uma lista de listas
    @{list}=  Read CSV File To List    ${path}
    
    # Acessa o nome, email e telefone da primeira pessoa (Joao)
    ${name} =    Get From List    ${list[1]}    0
    ${email} =    Get From List    ${list[1]}    1
    ${phone} =    Get From List    ${list[1]}    2
    
    Log    Nome: ${name}
    Log    Email: ${email}
    Log    Telefone: ${phone}
        
    Input Text    //*[@id="name"]    ${name}
    Input Text    //*[@id="email"]    ${email}
    Input Text    //*[@id="phone"]    ${phone}

And informou o país de origem
    Click Element   //*[@id="country"]/option[4]
    Sleep    5s

And clicar em "Enviar"
    Click Element    ${Button}
    Sleep    5s

And a mensagem de confirmação será exibida
    Wait Until Element Is Visible    ${verificação}    10
    Element Should Be Visible    ${verificação}
    Sleep    5s

And clicar no botão do youtube
    Click Element    ${youtube}

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
    And clicar no botão do youtube 
    Then o site será fechado
