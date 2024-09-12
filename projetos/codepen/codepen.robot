** Settings **
# Importar bibliotecas
Library  SeleniumLibrary

** Variables **
${url}    https://codepen.io
${nome}    ricardo
${email}    rfahham@hotmail.com

** Keywords **
Abrir Site
    Open Browser    ${url}    chrome

Login
    Click Element    //*[@id="page-layout"]/div/div[2]/a[2]

Username or Email
    Input Text    //*[@id="login-email-field"]    ${email}

Password
    Input Text    //*[@id="login-password-field"]    123456

Fechar Site
    Close Browser

** Test Cases **
Cenário 1: Login
    Abrir Site
    Login
    # Username or Email
    # Password
    # Fechar Site


