** Settings **
Library  SeleniumLibrary

** Variables **

${url_site}    https://amazon.com.br
${browser}    chrome
${locator_MacBook_Air}    //*[@id="twotabsearchtextbox"]
${locator_buscar}    //*[@id="nav-search-submit-button"]
${locator_escolha}    //span[contains(text(),"Apple notebook MacBook Air de 13 polegadas: Chip M2 da Apple com CPU de oito núcleos e GPU de dez núcleos, de 512 GB SSD - Cinza espacial")]
${validar}    //h1[contains(text()," Fazer login")]


# ${locator_}    //h1[contains(text(),"Fazer Login")]
# ${locator_}    //div[@id="Text"]
# ${locator_}    (//div[@class="Text"])[1]
# ${locator_}    //div[@placeholder="Text"]
# ${locator_}    //div[@href="https://"]

# Input Test    Element    text=
# Click Element
# Sleep     5s

** Keywords **
Abrir site
    Open Browser    ${url_site}    ${browser}

Pesquisar por MacBook_Air
    Input Text    ${locator_MacBook_Air}    text=Apple 2024 MacBook Air de 13 polegadas, Chip M3
    Click Element    ${locator_buscar}
    Sleep     10s

Clicar em MacBook Air
    Click Element    /span[contains(text(),"MacBook Air")]

Clicar na escolha
    Click Element    ${locator_escolha}
    Sleep     5s

Comprar agora
    Click Element     //*[@id="buy-now-button"]
    Sleep    5s

Verificar
    Wait Until Element Is Visible    ${validar}    10
    Element Should Be Visible    ${validar}

Fechar site
    Close Browser

** Test Cases **
Cenário: X
    Abrir site
    Pesquisar por MacBook_Air
    Clicar na escolha
    Comprar agora
    Verificar
    Fechar Site