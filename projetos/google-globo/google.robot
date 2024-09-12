** Settings **
Library  SeleniumLibrary

** Variables **

${url_google}    https://www.google.com/

** Keywords **
Open Google site 
    Open Browser    ${url_google}    chrome

** Test Cases **
Cenario 1: Test Google
    Open Google site
    Close Browser
