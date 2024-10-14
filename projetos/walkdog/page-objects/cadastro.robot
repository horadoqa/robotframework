*** Settings ***

Resource    ${EXECDIR}/resources/base.resource

Test Setup    Start session
Test Teardown    Finish session


*** Test Cases ***
Cadastro De Dog Walker Com Sucesso
    [Tags]    happy_path
    [Documentation]    Testa o cadastro de um Dog Walker com dados válidos.

    Fill signup form    Fernanda de Carvalho da Silva    fernanda_carvalho@gmail.com    00000014141    04534-011    1000   apto 202
    Submit signup form
    Popup have text    Recebemos o seu cadastro e em breve retornaremos o contato.


Cadastro Com CPF Incorreto
    [Tags]    cpf_inv
    [Documentation]    Testa o cadastro com CPF inválido.

    Fill signup form    Fernanda de Carvalho da Silva    fernanda_carvalho@gmail.com    00000014141a    04534-011    1000   apto 202
    Submit signup form
    Alert have text    CPF inválido
  
Cadastro Com Email Invalido
    [Tags]    email_inv
    [Documentation]    Testa o cadastro com e-mail inválido.

    Fill signup form    Fernanda de Carvalho da Silva    fernanda_carvalho&gmail.com    00000014141    04534-011    1000   apto 202
    Submit signup form
    Alert have text    Informe um email válido



Campos Obrigatorios
    [Tags]    required
    [Documentation]    Testa o cadastro sem preencher campos obrigatórios.
    
    Submit signup form

    Alert have text    Informe o seu nome completo
    Alert have text    Informe o seu melhor email
    Alert have text    Informe o seu CPF
    Alert have text    Informe o seu CEP
    Alert have text    Informe um número maior que zero
    Alert have text    Adcione um documento com foto (RG ou CHN)

    
# robot -d ../../results -i happy_path cadastro.robot
# robot -d ../../results -i cpf_inv cadastro.robot
# robot -d ../../results -i email_inv cadastro.robot
# robot -d ../../results -i required cadastro.robot
# robot -d ../../results cadastro.robot