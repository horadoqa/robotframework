** Settings **
Library  SeleniumLibrary

** Variables **

${url_site}    https://horadoqa.github.io/login/
${browser}    chrome
${locator_username}    //*[@id="username"]
${locator_password}    //*[@id="password"]
${locator_button}    //button[contains(text(),"Entrar")]
${error_dados_vazios}    //p[contains(text(),"E-mail e senha são obrigatórios!")]
${error_dados_errados}    //p[contains(text(),"E-mail ou senha inválidos!")]
${validar}      //h1[contains(text(),"Bem-vindo")]

** Keywords **
Abrir site
    Open Browser    ${url_site}    ${browser}
    # Maximize Browser Window

Não inserir dados
    Sleep    3s
    Click Element    ${locator_username}
    Input Text    ${locator_username}    text=
    Click Element    ${locator_password}
    Input Text    ${locator_password}    text=
    Click Element    ${locator_button}
    Sleep    3s
    Wait Until Element Is Visible    ${error_dados_vazios}    5
    Element Should Be Visible    ${error_dados_vazios}
    Sleep    3s

Inserir e-mail válido mas senha inválida
    Click Element    ${locator_username}
    Input Text    ${locator_username}    text=usuario@example.com
    Click Element    ${locator_password}
    Input Text    ${locator_password}    text=abcd1234
    Click Element    ${locator_button}
    Sleep    3s
    Wait Until Element Is Visible    ${error_dados_errados}    5
    Element Should Be Visible    ${error_dados_errados}
    Sleep    3s

Inserir e-mail inválido mas senha válida
    Click Element    ${locator_username}
    Input Text    ${locator_username}    text=usuarioexamplecom
    Click Element    ${locator_password}
    Input Text    ${locator_password}    text=1q2w3e4r
    Click Element    ${locator_button}
    Sleep    3s
    Wait Until Element Is Visible    ${error_dados_errados}    5
    Element Should Be Visible    ${error_dados_errados}
    Sleep    3s

Inserir e-mail e senha inválidos
    Click Element    ${locator_username}
    Input Text    ${locator_username}    text=usuarioexample.com
    Click Element    ${locator_password}
    Input Text    ${locator_password}    text=abcd1234
    Click Element    ${locator_button}
    Sleep    3s
    Wait Until Element Is Visible    ${error_dados_errados}    5
    Element Should Be Visible    ${error_dados_errados}
    Sleep    3s

Inserir e-mail e senha válidos
    Click Element    ${locator_username}
    Input Text    ${locator_username}    text=usuario@example.com
    Click Element    ${locator_password}
    Input Text    ${locator_password}    text=1q2w3e4r
    Click Element    ${locator_button}
    Sleep    3s
    Wait Until Element Is Visible    ${validar}    5
    Element Should Be Visible    ${validar}
    Sleep    20s

Fechar site
    Close Browser

** Test Cases **
Cenário 1: Dados Vazios
    Abrir site
    Não inserir dados
    Fechar Site

Cenário 2: Inserir e-mail válido mas senha inválida
    Abrir site
    Inserir e-mail válido mas senha inválida
    Fechar Site

Cenário 3: Inserir e-mail inválido mas senha válida
    Abrir site
    Inserir e-mail e senha inválidos
    Fechar Site

Cenário 4: Inserir e-mail e senha inválidos
    Abrir site
    Inserir e-mail e senha inválidos
    Fechar Site

Cenário 5: Inserir e-mail e senha válidos
    Abrir site
    Inserir e-mail e senha válidos
    Fechar Site