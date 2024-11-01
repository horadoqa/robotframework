** Settings **
Library    SeleniumLibrary
Library    SeleniumLibrary

** Variables **

${url_google}    https://www.google.com/
# ${pesquisar}    //*[@id="APjFqb"]
${pesquisar}    name=q
${confirmar}    //input[@class="gNO89b"]
${acessar}    //h3[contains(text(), "Robot Framework")][1]
${verificar}    //*[@id="getting-started"]

** Keywords **
Open Google site 
    Open Browser    ${url_google}    chrome
    Sleep    5s 

Pesquisar por palavra
    Input Text        ${pesquisar}    text=Robot Framework
    Sleep    5s

Confirmar
    # Press Keys    ${pesquisar}    ENTER
    Click Element    ${confirmar}
    Sleep    5s

Acessar a página
    Click Element    ${acessar}

Verificar
    Wait Until Element Is Visible    ${verificar}    10
    Element Should Be Visible    ${verificar}
    Sleep    5s

Fechar site
    Close Browser
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
** Test Cases **
Cenario 1: Test Google
    Open Google site
    Pesquisar por palavra
    Confirmar
    Acessar a página
    Verificar
    Fechar site