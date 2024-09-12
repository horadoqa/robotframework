** Settings **
Library  SeleniumLibrary

** Variables **

${url}    https://sandbox.moodledemo.net/login/index.php
# ${url}    https://globo.com

** Keywords **
Abrir Site
    Open Browser  ${url}  chrome

Fechar Site
    Close Browser

** Test Cases **
Cenário 1: Acessando o site sandbox
    Abrir Site
    Fechar Site
    