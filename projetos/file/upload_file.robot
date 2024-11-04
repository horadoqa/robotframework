*** Settings ***
Library         SeleniumLibrary
Test Teardown   Close Browser

*** Variables ***
## No Windows coloque barra dupla assim como mostra o exemplo abaixo!
${FILE}         C:\\projetos\\meu_arquivo_qualquer.txt

*** Test Cases ***
Teste Upload
    Faz upload de um arquivo

*** Keywords ***
Faz upload de um arquivo
    Open Browser    http://the-internet.herokuapp.com/upload    chrome
    Wait Until Element Is Visible   file-submit
    Choose File     file-upload     ${FILE}
    Click Button    file-submit
    Wait Until Page Contains        File Uploaded!
    Capture Page Screenshot