** Settings **
Library  SeleniumLibrary

** Variables **

${url_globoplay}     https://globoplay.globo.com/
${assine}            //*[@id="app"]/div/div/div[1]/div[2]/div/a/span
${vitrine}           https://vitrine.globo.com/globoplay?f_area=home&f_cpnt=banner_vendas&f_label=assinatura.assine_ja&url=https:%2F%2Fgloboplay.globo.com%2F&origemId=91628
${conta_globo}       (//p[contains(text(),"Conta Globo")])[1]
${criar_conta}       //*[@id="root"]/div[1]/main/div/div/div/div/div[2]/p/a

** Keywords **
Abrir Site Globoplay    
    Open Browser    ${url_globoplay}    chrome
    Sleep    5s

Assine já
    Click Element    ${assine}

Abrir Site Vitrine
    Open Browser    ${vitrine}    chrome
    Sleep    5s

Conta globo
    Click Element    ${conta_globo}
    Sleep    5s

Criar conta
    Click Element    ${criar_conta}

Dados
    Input Text    //*[@id="nome"]          Hora do QA
    Input Text    //*[@id="email"]         email@gmail.com
    Input Text    //*[@id="senha"]         1q2w3e4r
    Input Text    //*[@id="nascimento"]    01/01/2000

Termos de Uso
    Click Element    //*[@id="termsOfUse"]
    Sleep    5s

Fechar Site
    Close Browser

** Test Cases **
Cenário 1: Acessando o site
    Abrir Site Globoplay
    Assine já
    Abrir Site Vitrine
    Conta globo
    Criar conta
    Dados
    Termos de Uso
    Fechar Site