** Settings **
Library  SeleniumLibrary

** Variables **
${url}        https://robotframework.org/
${browser}    chrome

** Keywords **
Abrir Site
    Open Browser      ${url}    ${browser}
    Log    O site do Robot Framework está funcionando!

Fechar Site
    Close Browser

** Test Cases **
Cenário 1: Acessando o site do Robot
    Abrir Site
    Close Browser
    