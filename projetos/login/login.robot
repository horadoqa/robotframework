** Settings **
Library  SeleniumLibrary

** Variables **

${url_site}    http://127.0.0.1:5501/projetos/login/site/index.html
${browser}    chrome
${locator_username}    //*[@id="username"]
${locator_password}    //*[@id="password"]
${locator_button}    //button[contains(text(),"Entrar")]
${validar}      //h1[contains(text(),"Bem-vindo")]

** Keywords **
Abrir site
    Open Browser    ${url_site}    ${browser}
    Maximize Browser Window

Inserir dados
    Click Element    ${locator_username}
    Input Text    ${locator_username}    text=usuario@example.com
    Click Element    ${locator_password}
    Input Text    ${locator_password}    text=1q2w3e4r
    Click Element    ${locator_button}

Verificar
    Wait Until Element Is Visible    ${validar}    5
    Element Should Be Visible    ${validar}
    Sleep    5s

Fechar site
    Close Browser

** Test Cases **
Cenário: x
    Abrir site
    Inserir dados
    Verificar
    Fechar Site
