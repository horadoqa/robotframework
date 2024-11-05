*** Settings ***
Resource    keywords.resource

*** Test Cases ***
Cenário 1: Enviar dados pelo site
    FOR    ${i}    IN RANGE    ${QUANTIDADE}
        Cadastrar Usuário
    END
