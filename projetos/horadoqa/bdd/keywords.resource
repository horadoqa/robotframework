** Settings **
Library  SeleniumLibrary

** Variables **
${url}    http://localhost:5500/projetos/horadoqa/
${verificação}    //p[contains(text(), "Thank you for your participation!")]

** Keywords **
Abrir Site
    Open Browser    ${url}    chrome

Escolher um ítem da lista
    Click Element   //*[@id="select-itens"]/option[3]

Digitar algo sobre você
    Input Text    //*[@id="area"]    text=Testando site com ROBOT FRAMEWORK
    Sleep    5s

Inserir Dados Pessoais
    Input Text    //*[@id="fname"]    Ricardo Fahham
    Input Text    //*[@id="email"]    rfahham@hotmail.com
    Input Text    //*[@id="phone"]    21980025474
    Sleep    5s

Clicar em Submit
    Click Element   //form/input[4]

Verificar redirect
    Wait Until Element Is Visible    ${verificação}    5
    Element Should Be Visible    ${verificação}
    Sleep    5s
    
Fechar Site
    Close Browser