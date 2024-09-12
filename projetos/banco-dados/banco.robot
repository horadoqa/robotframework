*** Settings ***
Library    DatabaseLibrary

*** Variables ***
${DB_NAME}    horadoqa
${DB_USER}    root
${DB_PASS}    
${DB_HOST}    localhost
${DB_PORT}    3306


** Test Cases **
Verificar Dados no banco de Dados
    Connect To Database    psycopg2     ${DB_NAME}    -${DB_USER}    ${DB_PASS}    ${DB_HOST}    ${DB_PORT}
    ${resultado}=    Query    SELECT * FROM tabela_exemplo WHERE id=1
    Log    ${resultado}
    Disconnect From Database