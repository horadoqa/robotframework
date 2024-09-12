** Settings **
Library  SeleniumLibrary

** Variables **

${url}    https://ri.magazineluiza.com.br
${burguer}    //*[@id="Form1"]/header/div/div/div/div[1]/button
${informacoes}    //*[@id="heading-mobile-3"]/button
${planilha}    //*[@id="collapse-mobile-3"]/div/ul/li[2]/a
${resultados}    //*[@id="nWop18R/fOmOQtdlfZSqsA=="]

** Keywords **

Abrir site
    Open Browser    ${url}    chrome

Clicar no Burguer
    Click Element    ${burguer}
    Sleep    5s

Informações Financeiras
    Click Element    ${informacoes}
    Sleep    5s

Planilha de Resultado
    Click Element    ${planilha}
    Sleep    5s

Planilha de Resultados Trimestrais
    Click Element    ${resultados}
    Sleep    10s

Fechar site
    Close Browser

** Test Cases **
Cenário: Baixar Planilha
    Abrir site
    Clicar no Burguer
    Informações Financeiras
    Planilha de Resultado
    Planilha de Resultados Trimestrais
    Fechar site