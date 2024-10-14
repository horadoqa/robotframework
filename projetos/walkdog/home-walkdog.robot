** Settings **
Library  SeleniumLibrary

** Variables **

${url_site}    https://walkdog.vercel.app
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
    Sleep    5s

Verifica Title
    Title Should Be    Walkdog by Papito

Verifica Texto
    Page Should Contain    Cuidado e diversão em cada passo
    
Fechar site
    Close Browser

** Test Cases **
Cenário: Verificar site online
    Abrir site
    Verifica Title
    Verifica Texto
    Fechar Site
