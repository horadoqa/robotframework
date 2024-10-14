*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://walkdog.vercel.app/signup
${BROWSER}    Chrome
${DELAY}    3s
${Nome Completo}    Fernanda de Carvalho da Silva
${E-mail}    fernanda_carvalho@gmail.com
${CPF}    12345678901
${CPF Incorreto}    12345678900a
${CEP}    12345-678
${Número}    123
${Complemento}    Apto 101
${E-mail incorreto}    fernanda_carvalhogmail.com
${Documento}    ${EXECDIR}/document.png

*** Test Cases ***
Cadastro De Dog Walker Com Sucesso
    [Tags]    happy_path
    [Documentation]    Testa o cadastro de um Dog Walker com dados válidos.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    css=input[name="name"]    ${Nome Completo}
    Input Text    css=input[name="email"]    ${E-mail}
    Input Text    css=input[name="cpf"]    ${CPF}
    Input Text    css=input[name="cep"]    ${CEP}
    Input Text    css=input[name="addressNumber"]    ${Número}
    Input Text    css=input[name="addressDetails"]    ${Complemento}
    Choose File    css=input[type="file"]    ${Documento}
    Click Element    //button[contains(text(), "Cadastrar")]
    Sleep    2s
    Element Should Be Visible    xpath=//div[@class="swal2-html-container"]
    Sleep    2s
    Page Should Contain    Recebemos o seu cadastro e em breve retornaremos o contato.
    Sleep    2s
    Capture Page Screenshot    cadastro-sucess.png
    Close Browser


Cadastro Com CPF Incorreto
    [Tags]    cpf_inv
    [Documentation]    Testa o cadastro com CPF inválido.
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Input Text    css=input[name="cpf"]    ${CPF Incorreto}
    Click Element    xpath=//button[contains(text(), "Cadastrar")]
    Element Should Be Visible    xpath=//span[@class="alert-error"][text()="CPF inválido"]
    Capture Element Screenshot    xpath=//span[@class="alert-error"][text()="CPF inválido"]
    Sleep    2s
    Capture Page Screenshot    cpf-invalido.png
    Close Browser

Cadastro Com Email Invalido
    [Tags]    email_inv
    [Documentation]    Testa o cadastro com e-mail inválido.
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Input Text    css=input[name="email"]    ${E-mail incorreto}
    Click Element    xpath=//button[contains(text(), "Cadastrar")]
    Element Should Be Visible    xpath=//span[@class="alert-error"][text()="Informe um email válido"]
    Capture Element Screenshot    xpath=//span[@class="alert-error"][text()="Informe um email válido"]
    Sleep    2s
    Capture Page Screenshot    email-invalido.png
    Close Browser
    
    Close Browser

Campos Obrigatorios
    [Tags]    required
    [Documentation]    Testa o cadastro sem preencher campos obrigatórios.
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element    xpath=//button[contains(text(), "Cadastrar")]

    Element Should Be Visible    //span[@class="alert-error"][text()="Informe o seu nome completo"]
    Element Should Be Visible    //span[@class="alert-error"][text()="Informe o seu melhor email"]
    Element Should Be Visible    //span[@class="alert-error"][text()="Informe o seu CPF"]
    Element Should Be Visible    //span[@class="alert-error"][text()="Informe o seu CEP"]
    Element Should Be Visible    //span[@class="alert-error"][text()="Informe um número maior que zero"]
    Element Should Be Visible    //span[@class="alert-error"][text()="Adcione um documento com foto (RG ou CHN)"]
    
    Capture Page Screenshot    campos-obrigatorios.png 
    Close Browser

# robot -d ../../results -i happy_path cadastro.robot
# robot -d ../../results -i cpf_inv cadastro.robot
# robot -d ../../results -i email_inv cadastro.robot
# robot -d ../../results -i required cadastro.robot
# robot -d ../../results cadastro.robot