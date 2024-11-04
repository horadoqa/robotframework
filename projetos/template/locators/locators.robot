*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}    file:///${CURDIR}/index.html

*** Test Cases ***
Identificacao De Elementos WEB
    Open Browser    ${URL}    chrome
    Log    Acessou a página index.html.

    Log    Identificação simples dos locators:

    # Pelo ID
    Click Element    id=Theld
    Log    Clicou no elemento com ID "Theld".

    Click Element    Theld
    Log    Clicou no elemento com ID "Theld" (sem usar o prefixo "id="). 

    # Pelo Nome
    Click Element    name=Blink
    Log    Clicou no elemento com nome "Blink".

    Click Element    Blink
    Log    Clicou no elemento com nome "Blink" (sem usar o prefixo "name="). 

    # Pelo Texto do Link
    Click Link    link=Your Site.com
    Log    Clicou no link "Your Site.com".

    # Pelo XPATH
    Click Element    xpath=//a[@id='Theld']
    Log    Clicou no elemento localizado por XPATH com ID "Theld".

    # Pelo CSS
    Click Element    css=a[id='Theld']
    Log    Clicou no elemento localizado por CSS com ID "Theld".

    # Pelo DOM
    Click Element    dom=document.images[4]  # Ajuste de índice (começa em 0)
    Log    Clicou no quinto elemento de imagem no DOM.

    # Pela Tag
    Click Element    tag=div
    Log    Clicou no primeiro elemento <div> encontrado.

    Log    Explorando o CSS e XPATH para locators dinâmicos ou complexos:

    # Contendo um texto
    Click Element    xpath=//*[contains(text(), "exemplo")]
    Log    Clicou em um elemento que contém o texto "exemplo".

    # Contendo um valor
    Click Element    xpath=//input[contains(@type, 'Submit')]
    Log    Clicou em um input que contém o tipo "Submit".

    Click Element    css=input[type*='Submit']
    Log    Clicou em um input que contém o tipo "Submit" no CSS.

    # Iniciando por um valor 
    Click Element    xpath=//input[starts-with(@type, 'Submit')]
    Log    Clicou em um input cujo tipo começa com "Submit".

    Click Element    css=input[type^='Submit']
    Log    Clicou em um input cujo tipo começa com "Submit" no CSS.

    # Terminando por um valor 
    Click Element    xpath=//input[ends-with(@type, 'Submit')]
    Log    Clicou em um input cujo tipo termina com "Submit".

    Click Element    css=input[type$='Submit']
    Log    Clicou em um input cujo tipo termina com "Submit" no CSS.

    Close Browser
