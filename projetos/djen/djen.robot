** Settings **
Library  SeleniumLibrary
Library     OperatingSystem

** Variables **
${url}    https://www.tjmsp.jus.br/diario-de-justica-eletronico-nacional-djen/
${Processos}    xpath=//a[span[text()='Processos']] 
${consulta}    xpath=//a[span[text()='Consultas Processuais']]
${advogados}    xpath=//button[text()='Advogados']
${numero-da-oab}    xpath=//button[text()='Nro. da OAB']
${input-numero}    id=txt_nro_oab
${estado}    xpath=//select[@id='psq_oab']
${enviar}    //*[@id="btn_enviar"]

** Keywords **
Acessar a home
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Sleep    10s

Clicar Botão Aceito
    Click Element    id=cn-accept-cookie
    Sleep    10s

Clicar em Processos
    Wait Until Element Is Visible    ${Processos}    30
    Click Element    ${Processos}
    Sleep    60s

Escolher Consultas processuais
    Wait Until Element Is Visible    ${consulta}    30
    Click Element    ${consulta}

Clicar em Advogados
    Click Element    ${advogados}

Clicar em Número OAB
    Click Element    ${numero-da-oab}

Digitar número OAB
    ${Numero_OAB}=    Get Environment Variable    ENV_NUMERO_OAB
    Should Not Be Empty    ${Numero_OAB}    A variável de ambiente ENV_NUMERO_OAB não está definida.
    Input Text    ${input-numero}    ${Numero_OAB}
    Sleep    5s

Escolher Estado
    Select From List    ${estado}    RJ

Clicar em Enviar
    Click Element    ${enviar}

** Test Cases **
Cenário 1: Consulta de Processos
    Acessar a home
    Clicar Botão Aceito
    Clicar em Processos
    Escolher Consultas processuais
    Clicar em Advogados
    Clicar em Número OAB
    Digitar número OAB
    Escolher Estado
    Clicar em Enviar
    Close Browser



