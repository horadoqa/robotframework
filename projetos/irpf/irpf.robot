*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Receita Federal Page
Suite Teardown    Close Browser

*** Variables ***
${URL}        https://www.restituicao.receita.fazenda.gov.br/#/
${BROWSER}    Chrome
${TIMEOUT}    10s

*** Keywords ***
Open Browser To Receita Federal Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Acessar Página de Restituição da Receita Federal
    Wait Until Page Contains Element    xpath://*[@id="btnConsultaRestituicao"]    timeout=10s
    Page Should Contain Element    xpath://*[@id="btnConsultaRestituicao"]

Verificar Título da Página
    ${title}=    Get Title
    Should Contain    ${title}    Receita Federal

*** Test Cases ***
Cenário: Consulta Restituição
    Open Browser To Receita Federal Page
    Acessar Página de Restituição da Receita Federal
    Verificar Título da Página
