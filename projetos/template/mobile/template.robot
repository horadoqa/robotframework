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
${fechar_site}    Close Browser

** Keywords **
Abrir site
    Open Browser    ${abrir_site}    ${browser}

Próximos passos
    Click Element   ${locator_}
    Input Text    ${locator_}    text=

Fechar site
    ${fechar_site}

** Test Cases **
Cenário: X
    Abrir site
    Próximos passos
    Fechar Site
