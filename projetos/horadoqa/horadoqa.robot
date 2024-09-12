** Settings **
Library  SeleniumLibrary


** Variables **

${url}    http://127.0.0.1:5500/horadoqa/site/index.html
${verificação}    //h1[contains(text(), "Thank you for your participation!")]

** Keywords **
Abrir site
    Open Browser    ${url}    chrome

Escolher um ítem da lista
    Click Element    //*[@id="select-itens"]/option[3]

Digitar algo sobre a escolha
    Input Text    //*[@id="area"]    text=Porque o Robot Framework é o melhor !!!

Inserir dados
    Input Text    //*[@id="fname"]    Ricardo Fahham
    Input Text    //*[@id="email"]    rfahham@hotmail.com
    Input Text    //*[@id="phone"]    21982227843

Select Country
    Click Element   //*[@id="country"]/option[4]

Clicar em Submit
    Click Element    //*[@id="submit"]

Verificar o Redirect
    Wait Until Element Is Visible    ${verificação}    10
    Element Should Be Visible    ${verificação}
    Sleep    5s

Fechar site
    Close Browser

** Test Cases **
Cenário1: Formulário
    Abrir site
    Escolher um ítem da lista
    Digitar algo sobre a escolha
    Inserir dados
    Select Country
    Clicar em Submit
    Verificar o Redirect
    Fechar site

