# Estrutura

O Robot Framework é uma estrutura de automação de testes de código aberto, que utiliza uma abordagem baseada em palavras-chave (keyword-driven). 

A estrutura é organizada de maneira clara e simples, o que facilita a leitura e a escrita de testes. 

Ele permite a execução de testes de aceitação, de interface de usuário (UI), integração e outros tipos de testes.

*** Settings ***

    Bibliotecas externas que fornecem funcionalidades para o teste.

*** Variables ***

    Variáveis que você pode definir para reutilizar nos testes.

*** keywords ***

    - Palavras-chave 
        - Internas: Essas são fornecidas pelas bibliotecas que você importa no início do script.
    
        - Personalizadas: Você pode criar suas próprias palavras-chave.

*** Test Cases ***

    Contêm o código que será executado para validar uma funcionalidade específica. 