** Settings **
Library  SeleniumLibrary

** Variables **

${url_globo}    https://www.globo.com/

** Keywords **
Open Globo site 
    Open Browser    ${url_globo}    chrome

** Test Cases **
Cenario 1: Test Globo
    Open Globo site
    Close Browser