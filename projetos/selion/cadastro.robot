*** Settings ***
Library    Browser

*** Variables ***
${BROWSER}    chromium
${HEADLESS}    True
&{VIEWPORT}    width=1280    height=720


*** Test Cases ***
Cenário de teste
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    viewport=&{VIEWPORT}
    New Page    https://www.automationpratice.com.br/register
    Click    css=#user
    Fill Text    css=#user    Hora do QA
    Click    css=#email
    Fill Text    css=#email    horadoqa@gmail.com
    Click    css=#password
    Fill Text    css=#password    1q2w3e4r
    Click    css=#btnRegister
    Click    css=#swal2-title
    Click    text="OK"
    Close Browser