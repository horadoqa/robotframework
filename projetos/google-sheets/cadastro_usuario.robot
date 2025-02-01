*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections

*** Variables ***
${YOUR_GOOGLE_API_KEY}    
${SHEET_URL}    https://docs.google.com/spreadsheets/d/1E-d6-cCCkVxoHCFyIQhRw_hc4SBPt5N8eN8x6yNdiF4/edit?gid=0
${GOOGLE_SHEET_API_URL}    https://sheets.googleapis.com/v4/spreadsheets/1E-d6-cCCkVxoHCFyIQhRw_hc4SBPt5N8eN8x6yNdiF4/values/Sheet1?key=${YOUR_GOOGLE_API_KEY}

# URL do site de cadastro
${SITE_URL}    https://horadoqa.github.io/site/testes/index.html

*** Test Cases ***
Cadastrar Usuario A partir de Google Sheets
    # 1. Ler dados da planilha
    ${usuarios}=    Obter Dados Google Sheets
    :FOR    ${usuario}    IN    @{usuarios}
    \    Cadastrar No Site    ${usuario[0]}    ${usuario[1]}    ${usuario[2]}

Cadastrar No Site
    [Arguments]    ${nome}    ${email}    ${telefone}
    # 2. Abrir o navegador e o site
    Open Browser    ${SITE_URL}    Chrome
    Maximize Browser Window

    # 3. Preencher os campos do formulário
    Input Text    nome    ${nome}
    Input Text    email    ${email}
    Input Text    telefone    ${telefone}

    # 4. Submeter o formulário
    Click Button    cadastrar

    # 5. Fechar o navegador
    Close Browser

Obter Dados Google Sheets
    # 1. Fazer requisição para obter os dados da planilha
    ${response}=    Get    ${GOOGLE_SHEET_API_URL}
    
    # 2. Verificar se a requisição foi bem-sucedida (status 200)
    Should Be Equal As Strings    ${response.status_code}    200
    
    # 3. Extrair os dados da resposta JSON
    ${data}=    Get From Dictionary    ${response.json()}    values
    
    # 4. Definir a variável de dados para uso posterior
    Set Variable    ${data}    ${data}
