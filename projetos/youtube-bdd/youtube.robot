** Settings **
Library  SeleniumLibrary

** Variables **

${url}    https://www.youtube.com/

** Keywords **
Given access youtube site
    Open Browser    ${url}    chrome
    Sleep    5s

** Test Cases **
Cenário 1: Executar vídeo do site do youtube
    Given access youtube site
