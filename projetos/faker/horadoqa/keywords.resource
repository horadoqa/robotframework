*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary      locale=pt_Br

*** Variables ***
${QUANTIDADE}     3
${url}            https://horadoqa.github.io/site/testes/
${frameworks}     //*[@id="select-itens"]/option[4]
${verificação}    //h1[contains(text(), "Bem-vindo")]
${youtube}        xpath=//a[@class='youtube-button']

*** Keywords ***
Cadastrar Usuário
    Given que o usuário acessou o site
    And escolheu um item da lista de frameworks
    And digitou algo sobre a escolha
    And inseriu os dados pessoais
    And informou o país de origem
    And clicar em "Enviar"
    And a mensagem de confirmação será exibida
    And Clicar no botão para o Youtube
    Then o site será fechado


Given que o usuário acessou o site
    Open Browser    ${url}    chrome

And escolheu um item da lista de frameworks
    Click Element    ${frameworks}
    Sleep    3s

And digitou algo sobre a escolha
    Input Text    //*[@id="area"]    text=Robot Framework is an open source automation framework for test automation and robotic process automation (RPA).
    Sleep    3s

And inseriu os dados pessoais
    ${NOME_FAKE}  FakerLibrary.Name
    Log  ${NOME_FAKE}
    Input Text    //*[@id="name"]    text=${NOME_FAKE}

    ${EMAIL_FAKE}  FakerLibrary.Email
    Log  ${EMAIL_FAKE}
    Input Text    //*[@id="email"]    text=${EMAIL_FAKE}

    ${PHONE_FAKE}  FakerLibrary.Phone Number
    Log  ${PHONE_FAKE}
    Input Text    //*[@id="phone"]    text=${PHONE_FAKE}

And informou o país de origem
    Click Element   //*[@id="country"]/option[4]
    Sleep    3s

And clicar em "Enviar"
    Click Element    //*[@id="submit-button"]
    Sleep    3s

And a mensagem de confirmação será exibida
    Wait Until Element Is Visible    ${verificação}    10
    Element Should Be Visible    ${verificação}
    Sleep    3s

And Clicar no botão para o Youtube
    Click Element    ${youtube}
    Sleep    3s

Then o site será fechado
    Close Browser