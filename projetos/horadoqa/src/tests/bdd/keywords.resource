*** Settings ***
Library  SeleniumLibrary


*** Variables ***

${url}           http://127.0.0.1:5500/src/fe/index.html
${frameworks}    //*[@id="select-itens"]/option[3]
${text}          //*[@id="area"]    
${nome}          //*[@id="name"]    
${e-mail}        //*[@id="email"]    
${telefone}      //*[@id="phone"]    
${país}          //*[@id="country"]/option[4]
${verificação}   //h1[contains(text(), "Obrigado por sua participação !!!")]


*** Keywords ***
Given que o usuário acessou o site
    Open Browser    ${url}    chrome

And escolheu um item da lista de frameworks
    Click Element    ${frameworks}
    Sleep    5s

And digitou algo sobre a escolha
    Input Text    ${text}    text=Robot Framework is an open source automation framework for test automation and robotic process automation (RPA).
    Sleep    5s

And inseriu os dados pessoais
    Input Text    ${nome}    Ricardo Fahham
    Input Text    ${e-mail}    horadoqa@gmail.com
    Input Text    ${telefone}    219876543210

And informou o país de origem
    Click Element   ${país}
    Sleep    5s

And clicar em "Enviar"
    Click Element    //*[@id="submitButton"]
    Sleep    60s

And a mensagem de confirmação será exibida
    Wait Until Element Is Visible    ${verificação}    10
    Element Should Be Visible    ${verificação}
    Sleep    5s

Then o site será fechado
    Close Browser