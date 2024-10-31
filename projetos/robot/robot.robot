** Settings **
Library  SeleniumLibrary

** Variables **


** Keywords **
Abrir Site
    Open Browser    https://robotframework.org/  chrome
    Log    O site do Robot Framework está funcionando!

Fechar Site
    Close Browser

** Test Cases **
Cenário 1: Acessando o site do Robot
    Abrir Site
    Close Browser
    