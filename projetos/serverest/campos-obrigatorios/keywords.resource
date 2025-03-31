** Settings **
Library    SeleniumLibrary

** Variables **

${URL}                   https://front.serverest.dev/login
${EMAIL}                 //*[@id="email"]
${PASSWORD}              //*[@id="password"]
${BUTTON}                //*[@id="root"]/div/div/form/button
${VERIFICAR_EMAIL}       xpath=//*[contains(text(), "Email é obrigatório")]
${VERIFICAR_PASSWORD}    xpath=//*[contains(text(), "Password é obrigatório")]

** Keywords **
Open site    
    Open Browser    ${URL}    chrome
    Sleep    5s

Email
    Input Text    ${EMAIL}    text=
    Sleep    5s

Password
    Input Text    ${PASSWORD}    text=
    Sleep    5s

Entrar
    Click Element    ${BUTTON}
    Sleep    5s

Verificar
    Wait Until Element Is Visible    ${VERIFICAR_EMAIL}    10
    Element Should Be Visible    ${VERIFICAR_PASSWORD}
    Sleep    5s

Fechar site
    Close Browser