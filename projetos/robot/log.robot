*** Settings ***


*** Variables ***
${mensagem}    O Robot Framework está funcionando!

*** Keywords ***
Verificar log
    Log    ${mensagem}

*** Test Cases ***
Cenário: Log
    Verificar log
    
