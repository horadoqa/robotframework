*** Settings ***


*** Variables ***
${NOME}            Ricardo           # Tipo String
${SOBRENOME}       Fahham            # Tipo String 
${ESTADO_CIVIL}    Casado            # Tipo String 
${IDADE}           ${54}             # Tipo Inteiros (int)
${PESO}            ${102}            # Tipo Inteiros (int)
${ALTURA}          ${1.87}           # Tipo Ponto flutuante (float)
${CONDIÇÂO_FALSE}        ${False}    # Tipo Booleano (bool)
${CONDIÇÂO_TRUE}        ${True}      # Tipo Booleano (bool)
${VALOR1}    ${2}
${VALOR2}    ${4}
${LISTA}         [1, 2.5, 'Texto']    # Tipo Lista - Coleção ordenada de itens, que podem ser de tipos diferentes. 
@{DICIONÁRIO}    {'nome': 'João', 'idade': 25}    # Tipo Dicionário - Estrutura que armazena pares de chave e valor. (chave:valor)


*** Tasks **
Teste
    Log To Console    ${NOME} ${SOBRENOME}, ${IDADE} anos, ${PESO} quilos, ${ALTURA} m, ${ESTADO_CIVIL}
    Log To Console    Soma ${2 + 4}
    Log To Console    Soma ${${VALOR1} + ${VALOR2}}
    Log To Console    Subtração ${2 - 4}
    Log To Console    Multiplicação ${2 * 4}
    Log To Console    Divisão ${2 / 4}
    Log To Console    Potência ${2 ** 4}
    Log To Console    Resto ${2 % 4}
    Log To Console    Raiz quadrada ${2 ** 0.5}
    Log To Console    Raiz cúbica ${2 ** (1/3)}