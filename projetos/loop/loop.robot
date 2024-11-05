*** Settings ***
Documentation    O loop é uma funcionalidade nativa do Robot Framework. 
...    O Robot Framework permite que você utilize loops através das keywords FOR e WHILE, 
...    entre outras, para realizar iterações em suas test cases ou keywords.

*** Variables ***
@{FRUTAS}    maçã    banana    uva    abacaxi

*** Keywords ***
1 - Usando FOR com RANGE
    FOR    ${COUNT}    IN RANGE    1    16
    Log    Meu contador atual é: ${COUNT}. 
    Run Keyword If    ${COUNT} == 16    Log    Acabou o loop!!!
    END

2 - Usando FOR com LISTA
    FOR    ${ITEM}    IN    @{FRUTAS}
    Log    Minha fruta é: ${ITEM}
    Run Keyword If    '${ITEM}' == 'abacaxi'    Log    Acabou o loop!!!
    END

3 - Saindo de um FOR
    FOR    ${ITEM}    IN    @{FRUTAS}
    Exit For Loop If    '${ITEM}' == 'uva'
    Log    Minha fruta é: ${ITEM}
    END

4 - Usando a keyword REPEAT
    Repeat Keyword    4    Log    Vamos logar essa frase 4 vezes!!!

*** Test Cases ***
Caso de teste FOR
    # 1 - Usando FOR com RANGE
    # 2 - Usando FOR com LISTA
    # 3 - Saindo de um FOR
    4 - Usando a keyword REPEAT

