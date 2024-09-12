** Settings **
Library  SeleniumLibrary

** Variables **
${url}    https://www.tjmsp.jus.br/diario-de-justica-eletronico-nacional-djen/
${Processos}    //*[@id="nav-menu-item-564"]/a

# (//a[@class="menu-link main-menu-link"])[3]   

${consulta}    //*[@id="nav-menu-item-7618"]/a
${advogados}    //*[@id="home"]/div[2]/div/div[4]/div/button[2]
${numero-da-oab}    //*[@id="home"]/div[2]/div/div[4]/div[1]/button[1]
${input-numero}    //*[@id="txt_nro_oab"]
${oab}    96259
${estado}    //*[@id="psq_oab"]/div[4]/div/select
${enviar}    //*[@id="btn_enviar"]

** Keywords **
Acessar a home
    Open Browser    ${url}    chrome

Clicar Botão Aceito
    Click Element    //*[@id="cn-accept-cookie"]

Clicar no Burguer
    Click Element    //*[@id="header-mobile-section-2-row-0-column-0"]/div

Clicar em Processos
    Wait Until Element Is Visible    ${Processos}    30
    Click Element    ${Processos} 

Escolher Consultas processuais
    Click Element    ${consulta}

Clicar em Advogados
    Click Element    ${advogados}

Clicar em Número OAB
    Click Element    ${numero-da-oab}

Digitar número OAB
    Input Text    ${input-numero}    ${oab}

Escolher Estado
    Input Text    ${estado}    RJ

Clicar em Enviar
    Click Element    ${enviar}

** Test Cases **
Cenário 1: Consulta de Processos
    Acessar a home
    Clicar Botão Aceito
    Clicar no Burguer
    Clicar em Processos
    # Escolher Consultas processuais
    # Clicar em Advogados
    # Clicar em Número OAB
    # Digitar número OAB
    # Escolher Estado
    # Clicar em Enviar
    Close Browser



