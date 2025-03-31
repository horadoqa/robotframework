** Settings **
Library    SeleniumLibrary

** Variables **
${URL}          https://front.serverest.dev/cadastrarusuarios
${NOME}         //*[@id="nome"]
${EMAIL}        //*[@id="email"]
${PASSWORD}     //*[@id="password"]
${ADMIN}        //*[@id="root"]/div/div/form/div[4]/div/label
${BUTTON}       //*[@id="root"]/div/div/form/div[5]/button
${VERIFICAR}    xpath=//*[contains(text(), "Este email já está sendo usado")]


** Keywords **
Open site    
    Open Browser    ${URL}    chrome
    Sleep    5s

Nome
    Input Text    ${NOME}    text=Hora do QA
    Sleep    5s

Email
    Input Text    ${EMAIL}    text=horadoqa@serverest.com
    Sleep    5s

Password
    Input Text    ${PASSWORD}    text=1q2w3e4r
    Sleep    5s

Admin
    Click Element    ${ADMIN}
    Sleep    5s

Cadastrar
    Click Element    ${BUTTON}
    Sleep    5s

Verificar
    Wait Until Element Is Visible    ${VERIFICAR}    10
    Element Should Be Visible    ${VERIFICAR}
    Sleep    5s

Fechar site
    Close Browser