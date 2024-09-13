** Settings **
Library  SeleniumLibrary

** Variables **

${url}    https://www.amazon.com.br/
${locator_MacBook_Air}    //*[@id="twotabsearchtextbox"]
${locator_buscar}    //*[@id="nav-search-submit-button"]
${locator_escolha}    //span[contains(text(),"Apple 2024 MacBook Air (de 13 polegadas, Chip M3 da Apple com CPU de oito núcleos e GPU de oito núcleos, 8GB Memória unificada, de 256 GB) - Cinza-espacial")]
${locator_comprar}    //*[@id="buy-now-button"]
${validar}    //h1[contains(text()," Fazer login")]

** Keywords **

Abrir site
    Open Browser    ${url}    chrome

Pesquisar por MacBook_Air
    Input Text    ${locator_MacBook_Air}    text=Apple 2024 MacBook Air de 13 polegadas, Chip M3
    Click Element    ${locator_buscar}

Clicar na escolha
    Click Element    ${locator_escolha}

Comprar agora
    Click Element    ${locator_comprar}

Verificar
    Wait Until Element Is Visible    ${validar}    10
    Element Should Be Visible    ${validar}
    Sleep    5s

Fechar Site
    Close Browser

** Test Cases **
Cenário: Simular uma compra na Amazon
    Abrir site
    Pesquisar por MacBook_Air
    Clicar na escolha
    Comprar agora
    Verificar
    Fechar Site