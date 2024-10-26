*** Settings ***
Resource         ../resources/testes_recursos.resource
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Cenário de teste: Castro de um novo usuário - Caminho Feliz
    Passo 1 - Acessar a página de Login da Farmapp
    Passo 2 - Clicar no botão de Cadastra-se
    Passo 3 - Clicar nome completo
    Passo 4 - Digitar nome completo
    Passo 5 - Clicar campo e-mail
    Passo 6 - Digitar e-mail
    Passo 7 - Clicar botão de Cargo
    Passo 8 - Selecionar cargo de Farmacêutico
    Passo 9 - Clicar campo CPF
    Passo 10 - Digitar CPF
    Passo 11 - Clicar campo Senha
    Passo 12 - Inserir senha
    Passo 13 - Clicar Campo Confirme sua senha
    Passo 14 - Inserir Confirmar senha
    Passo 15 - Clicar botão Cadastrar