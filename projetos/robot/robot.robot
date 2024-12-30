*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}        https://robotframework.org
${browser}    chrome
${expected_title}    Robot Framework

*** Keywords ***
Abrir Site
    Open Browser      ${url}    ${browser}
    Log    O site do Robot Framework está funcionando!
    Sleep    5s

Verificar Title
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    ${expected_title}
    
Fechar Site
    Close Browser

*** Test Cases ***
Cenário 1: Acessando o site do Robot
    Abrir Site
    Verificar Title
    Close Browser
    