** Settings **
Library  SeleniumLibrary

** Variables **

${url_site}    https://
${browser}    chrome
${locator_}    //element[contains(text(),"Text")]
${locator_}    //div[@id="Text"]
${locator_}    (//div[@class="Text"])[1]
${locator_}    //div[@placeholder="Text"]
${locator_}    //div[@href="https://"] 
${validar}      
# Sleep     5s


** Keywords **
Abrir site
    Open Browser    ${url_site}    ${browser}
    Maximize Browser Window

Próximos passos
    Click Element    ${locator_}
    Input Text    ${locator_}    text=

Verificar
    Wait Until Element Is Visible    ${validar}    5
    Element Should Be Visible    ${validar}
    Sleep    5s

Fechar site
    Close Browser

** Test Cases **
Cenário: X
    Abrir site
    Próximos passos
    Verificar
    Fechar Site
