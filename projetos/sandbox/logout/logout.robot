** Settings **
Library  SeleniumLibrary

** Variables **

${url}               https://sandbox.moodledemo.net/login/index.php
${input_username}    name:username
${input_password}    name:password
${button_Acessar}    id:loginbtn
${button_user_menu_toggle}    id:user-menu-toggle
${button_Logout}    //*[@id="carousel-item-main"]/a[10]

** Keywords **
Abrir Site
    Open Browser    ${url}    chrome

Preencher campos
    Input Text    ${input_username}   admin
    Input Text    ${input_password}   sandbox

Clicar em Acessar
    Click Element   ${button_Acessar}
    Sleep    10s

Clicar em Logout
    Click Element   ${button_user_menu_toggle}
    Click Element   ${button_Logout}
    Sleep    10s

Fechar Site
    Close Browser

** Test Cases **
Cenário 1: Acessando o site sandbox
    Abrir Site
    Preencher campos
    Clicar em Acessar
    Clicar em Logout
    Fechar Site
    