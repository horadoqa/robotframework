** Settings **
Library  SeleniumLibrary

** Variables **

${url}    https://globoplay.globo.com

** Keywords **
Abrir Site
    Open Browser    ${url}    chrome

** Test Cases **
Cenário 1: Acessando o site
    Abrir Site