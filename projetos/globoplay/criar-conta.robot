** Settings **
Library  SeleniumLibrary

** Variables **

${url}    https://globoplay.globo.com/
${vitrine}    https://vitrine.globo.com/globoplay?f_area=home&f_cpnt=banner_vendas&f_label=assinatura.assine_ja&url=https:%2F%2Fgloboplay.globo.com%2F&origemId=91628
${login}    https://login.globo.com/cadastro/6999?url=https%3A%2F%2Fid.globo.com%2Fauth%2Frealms%2Fglobo.com%2Flogin-actions%2Fauthenticate%3Fsession_code%3Dt0uu_bcjjazIPYBthBskHQUmgTLvYw3htVMd1DpCilc%26execution%3D8feb8053-1729-44f9-bfa0-783a70e68d14%26client_id%3Dvitrine-globo%2540apps.globoid%26tab_id%3DnSza5LCwgvw%26request-context%3Ds0w5xi&error=&request-context=s0w5xi&_gl=1*1a1x5az*_gcl_au*MTQ1MjA1MTY1NS4xNzI2MTQwMzQ0*_ga*MzE2ODcyMDQyMS4xNzI2MTQwMzQ2*_ga_G5YX0X0P68*MTcyNjE0MDQwMS4xLjEuMTcyNjE0Mjk1OS40OC4wLjA.

** Keywords **
Abrir Site Globoplay
    Open Browser    ${url}    chrome
    Sleep    5s

Assine já
    Click Element    //*[@id="app"]/div/div/div[1]/div[2]/div/a/span
    Sleep    5s

Abrir Site Vitrine
    Open Browser    ${vitrine}    chrome
    Sleep    5s

Conta globo
    Click Element    (//p[contains(text(),"Conta Globo")])[1]
    Sleep    5s

Criar conta
    Click Element    //*[@id="root"]/div[1]/main/div/div/div/div/div[2]/p/a
    Sleep    20s

Página de login
    Open Browser    ${login}    chrome
    Sleep    5s

Nome
    Input Text    //*[@id="nome"]    Hora do QA

E-mail
    Input Text    //*[@id="email"]    email@gmail.com

Senha
    Input Text    //*[@id="senha"]    1q2w3e4r

Data
    Input Text    //*[@id="nascimento"]    01/01/2000

Termos
    Click Element    //*[@id="termsOfUse"]
    Sleep    10s

Cadastrar
    Click Element    locator//*[@id="content"]/form/div[3]/button

Fechar Site
    Close Browser

** Test Cases **
Cenário 1: Acessando o site
    Abrir Site Globoplay
    Assine já
    Abrir Site Vitrine
    Conta globo
    Criar conta
    Página de login
    Nome
    E-mail
    Senha
    Data
    Termos
    Fechar Site