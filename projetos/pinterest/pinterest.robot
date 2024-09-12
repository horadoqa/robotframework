** Settings **
Library  SeleniumLibrary

** Variables **
${url}    https://br.pinterest.com/ideas/
${animais}    //h3[contains(text(),"Animals")]
${validar}    //h2[contains(text(),"Explore")]


** Keywords **
Abrir site
    Open Browser    ${url}    chrome
    Sleep    5s

Clicar em Animais
    Click Element    ${animais}
    Sleep    5s

Validar
    Wait Until Element Is Visible    ${validar}    5
    Element Should Be Visible    ${validar}
    Sleep    5s

Fechar site
    Close Browser

** Test Cases **
Cenário: Acessar página do Pinterest
    Abrir site
    Clicar em Animais
    Validar
    Fechar site