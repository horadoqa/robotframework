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
${COUNT}    1
${QUANTIDADE}     5

*** Keywords ***
Cadastrar Usuário
    # Lê o arquivo CSV e converte em uma lista de listas
    @{list}=  Read CSV File To List    ${path}
    
    WHILE    ${COUNT} < ${QUANTIDADE}
        
        Given que o usuário acessou o site
        And escolheu um item da lista de frameworks
        And digitou algo sobre a escolha
        
        # Acessa o nome, email e telefone da linha ${i}
        ${name} =    Get From List    ${list[${COUNT}]}    0
        ${email} =    Get From List    ${list[${COUNT}]}    1
        ${phone} =    Get From List    ${list[${COUNT}]}    2

        Log    Nome: ${name}
        Log    Email: ${email}
        Log    Telefone: ${phone}

        Input Text    //*[@id="name"]    ${name}
        Input Text    //*[@id="email"]    ${email}
        Input Text    //*[@id="phone"]    ${phone}
        Sleep    5s

        And informou o país de origem
        And clicar em "Enviar"
        And a mensagem de confirmação será exibida
        And clicar no botão do youtube
        Then o site será fechado
    
        ${COUNT}=    Evaluate    ${COUNT} + 1
        Log    Na iteração seguinte o COUNT é: ${COUNT}
    END

Given que o usuário acessou o site
    Open Browser    ${URL}    chrome

And escolheu um item da lista de frameworks
    Click Element    ${frameworks}
    Wait Until Element Is Visible    ${frameworks}    10

And digitou algo sobre a escolha
    Input Text    //*[@id="area"]    ${text}
    Wait Until Element Is Visible    //*[@id="area"]    10

And inseriu os dados pessoais
    # Lê o arquivo CSV e converte em uma lista de listas
    @{list}=  Read CSV File To List    ${path}

    # Acessa o nome, email e telefone da linha ${i}
    ${name} =    Get From List    ${list[${COUNT}]}    0
    ${email} =    Get From List    ${list[${COUNT}]}    1
    ${phone} =    Get From List    ${list[${COUNT}]}    2

    Log    Nome: ${name}
    Log    Email: ${email}
    Log    Telefone: ${phone}

    Input Text    //*[@id="name"]    ${name}
    Input Text    //*[@id="email"]    ${email}
    Input Text    //*[@id="phone"]    ${phone}

And informou o país de origem
    Click Element   //*[@id="country"]/option[4]
    Wait Until Element Is Visible    //*[@id="country"]    10

And clicar em "Enviar"
    Wait Until Element Is Visible    ${Button}    20
    Click Element    ${Button}

And a mensagem de confirmação será exibida
    Wait Until Element Is Visible    ${verificação}    10
    Element Should Be Visible    ${verificação}
    Sleep    5s

And clicar no botão do youtube
    Wait Until Element Is Visible    ${youtube}    10
    Click Element    ${youtube}
    Sleep    5s

Then o site será fechado
    Close Browser