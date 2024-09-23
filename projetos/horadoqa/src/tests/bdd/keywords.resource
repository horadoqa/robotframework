*** Settings ***
Library  SeleniumLibrary


*** Variables ***

${url}           http://127.0.0.1:5500/site/index.html
${frameworks}    //*[@id="select-itens"]/option[3]
${text}          //*[@id="area"]    text=Robot Framework is an open source automation framework for test automation and robotic process automation (RPA).
${nome}          //*[@id="name"]    Ricardo Fahham
${e-mail}        //*[@id="email"]    rfahham@hotmail.com
${telefone}      //*[@id="phone"]    21982227843
${país}          //*[@id="country"]/option[4]
${verificação}   //h1[contains(text(), "Thank you for your participation!")]


*** Keywords ***
Given que o usuário acessou o site
    Open Browser    ${url}    chrome

And escolheu um item da lista de frameworks
    Click Element    ${frameworks}

And digitou algo sobre a escolha
    Input Text    ${text}
    Sleep    5s

And inseriu os dados pessoais
    Input Text    ${nome}
    Input Text    ${e-mail}
    Input Text    ${telefone}
    Sleep    5s

And informou o país de origem
    Click Element   ${país}
    Sleep    5s

And clicar em "Send"
    Click Element    //*[@id="submit-button"]

And a mensagem de confirmação será exibida
    Wait Until Element Is Visible    ${verificação}    10
    Element Should Be Visible    ${verificação}
    Sleep    5s

Then o site será fechado
    Close Browser