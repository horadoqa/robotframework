** Settings **
Library  SeleniumLibrary

** Variables **

${abrir_site}    https://
${browser}    chrome
${locator_}    //element[contains(text(),"Text")]
${locator_}    //div[@id="Text"]
${locator_}    (//div[@class="Text"])[1]
${locator_}    //div[@placeholder="Text"]
${locator_}    //div[@href="https://"] 

** Keywords **
Abrir site
    Open Browser    ${abrir_site}    ${browser}
    Maximize Browser Window
Próximos passos
    Click Element    locator
    Input Text    locator    text=

Fechar site
    Close Browser

** Test Cases **
Cenário: X
    Abrir site
    Próximos passos
    Fechar Site
