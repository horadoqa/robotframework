** Settings **
Library    SeleniumLibrary

** Variables **

${url}    https://www.google.com/
# ${pesquisar}    //*[@id="APjFqb"]
${pesquisar}    name=q
${confirmar}    //input[@class="gNO89b"]
${acessar}    //h3[contains(text(), "Robot Framework")][1]
${verificar}    //*[@id="getting-started"]


** Keywords **
Open Google site    
    Open Browser    ${url}    chrome
    Sleep    5s

Pesquisar pela palavra
    Input Text    ${pesquisar}    text=Robot Framework
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