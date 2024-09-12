# Organizando

O objetivo é separar o BDD do executor do teste

O Settings e Test Cases ficam no arquivo.robot

** Settings **
Library  SeleniumLibrary

** Test Cases **
Cenario 1: Test Google
    Open Google site
    Close Browser

Criar um arquivo para o `keywords.resource`

** Settings **
Library  SeleniumLibrary

** Variables **

${url_google}    https://www.google.com/

** Keywords **
Open Google site 
    Open Browser    ${url_google}    chrome

