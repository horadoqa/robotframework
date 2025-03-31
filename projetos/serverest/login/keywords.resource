** Settings **
Library    SeleniumLibrary

** Variables **
${URL}          https://front.serverest.dev/login
${EMAIL}        //*[@id="email"]
${PASSWORD}     //*[@id="password"]
${BUTTON}       //*[@id="root"]/div/div/form/button
${VERIFICAR}    xpath=//*[contains(text(), "Este é seu sistema para administrar seu ecommerce.")]

** Keywords **
Open site    
    Open Browser    ${URL}    chrome
    Sleep    5s

Email
    Input Text    ${EMAIL}    text=horadoqa@serverest.com
    Sleep    5s

Password
    Input Text    ${PASSWORD}    text=1q2w3e4r
    Sleep    5s

Entrar
    Click Element    ${BUTTON}
    Sleep    5s

Verificar
    Wait Until Element Is Visible    ${VERIFICAR}    10
    Element Should Be Visible    ${VERIFICAR}
    Sleep    5s

Fechar site
    Close Browser