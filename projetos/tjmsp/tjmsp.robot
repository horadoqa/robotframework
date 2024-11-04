*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${url}    https://ww2.tjmsp.jus.br/p_processos.htm
${Advogados}    //*[@id="home"]/div[2]/div/div[4]/div/button[2]
${oab}    //*[@id="home"]/div[2]/div/div[4]/div[1]/button[1]
${verificação}    //html/body[contains(text(), "The page cannot be displayed because an internal server error has occurred.")]

*** Keywords ***
Acessar a home
    Open Browser    ${url}    chrome

Clicar Botão Advogados
    Click Element    ${Advogados}

Clicar no Nro. da OAB
    Click Element    ${oab}    

Clicar em Número da OAB
    ${Numero_OAB}=    Get Environment Variable    ENV_NUMERO_OAB
    Should Not Be Empty    ${Numero_OAB}    A variável de ambiente ENV_NUMERO_OAB não está definida.
    Input Text    //*[@id="txt_nro_oab"]    ${Numero_OAB}

Escolher Estado
    Click Element   //*[@id="psq_oab"]/div[4]/div/select/option[20]

Clicar botão Enviar
    Click Element    //*[@id="btn_enviar"]

Verificação
    Element Should Be Visible    ${verificação}

*** Test Cases ***
Cenário 1: Consulta de Processos
    Acessar a home
    Clicar Botão Advogados
    Clicar no Nro. da OAB
    Clicar em Número da OAB
    Escolher Estado
    Clicar botão Enviar
    Verificação
    Close Browser
