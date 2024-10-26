*** Settings ***
Library    SeleniumLibrary
Library    String
Library    FakerLibrary      locale=pt_Br

*** Variables ***
${URL}                https://staging-farmapp.vercel.app/
${castraseElemento}   //a[contains(.,'Cadastre-se')]
${Castra-se}           //h3[@class='tracking-tight text-center font-bold text-[32px] text-neutral leading-10 mb-0.5'][contains(.,'Cadastre-se')]
${CampoNomeCompleto}   //input[@name='fullname']
${CampoEmail}          //input[@name='email']    
${EMAIL}                @teste.com.br 
${Botao_Cargo}          //button[contains(@type,'button')]
${SelectFarmaceutico}   //span[contains(.,'Farmacêutico')] 
${CampoCPF}             //input[contains(@placeholder,'Digite seu CPF')]
${CampoSenha}           //input[contains(@name,'password')]
${SENHA}                123456789
${CampoConfSenha}       //input[@name='confirmPassword']
${Botao_Cadastrar}      //button[@type='submit'] 

*** Keywords ***

Abrir o navegador
    Open Browser    browser=headlesschrome
    Maximize Browser Window

Fechar o navegador
    Close Browser


Passo 1 - Acessar a página de Login da Farmapp
    Go To    url=${URL} 

Passo 2 - Clicar no botão de Cadastra-se
    Wait Until Element Is Visible    locator=${castraseElemento}
    Click Element                    locator=${castraseElemento}
    Sleep    1s

Passo 3 - Clicar nome completo
    Wait Until Element Is Visible    locator=${CampoNomeCompleto}
    Click Element                    locator=${CampoNomeCompleto}
    Sleep    1s

Passo 4 - Digitar nome completo
    Wait Until Element Is Visible    locator=${CampoNomeCompleto}
    ${NOME_FAKE}  FakerLibrary.Name
    Log  ${NOME_FAKE} 
    Input Text        locator=${CampoNomeCompleto}    text=${NOME_FAKE} 
    
    Sleep   1s
Passo 5 - Clicar campo e-mail
    Wait Until Element Is Visible    locator=${CampoEmail} 
    Click Element                    locator=${CampoEmail}
    Sleep    1s


Passo 6 - Digitar e-mail
    ${EMAIL}  FakerLibrary.Email
    Wait Until Element Is Visible    locator=${CampoEmail} 
    Input Text    locator=${CampoEmail}   text=${EMAIL}
    Sleep    1s

Passo 7 - Clicar botão de Cargo
    Wait Until Element Is Visible    locator=${Botao_Cargo}
    Click Element                   locator=${Botao_Cargo}
    Sleep  1s

Passo 8 - Selecionar cargo de Farmacêutico
    Wait Until Element Is Visible    locator=${Botao_Cargo}
    Click Element                    locator=${SelectFarmaceutico}
    Sleep  1s

Passo 9 - Clicar campo CPF
    Wait Until Element Is Visible    locator=${CampoCPF}
    Click Element                    locator=${CampoCPF} 
    Sleep  1s

Passo 10 - Digitar CPF
    ${CPF}     Generate Random String  length=11   chars=[NUMBERS]
    Click Element    locator=${CampoCPF} 
    Input Text       locator=${CampoCPF}   text=${CPF} 
    Sleep    1s

Passo 11 - Clicar campo Senha
   Wait Until Element Is Visible    locator=${CampoSenha} 
   Click Element                    locator=${CampoSenha}
   Sleep  1s

Passo 12 - Inserir senha
    Wait Until Element Is Visible    locator=${CampoSenha} 
    Input Password                   locator=${CampoSenha}  password=${SENHA}  
    Sleep  1s

Passo 13 - Clicar Campo Confirme sua senha
    Wait Until Element Is Visible    locator=${CampoConfSenha}
    Click Element                    locator=${CampoConfSenha}   
    Sleep  1s

Passo 14 - Inserir Confirmar senha
    Wait Until Element Is Visible    locator=${CampoConfSenha}
    Input Password                   locator=${CampoConfSenha}  password=${SENHA}  
    Sleep  1s

Passo 15 - Clicar botão Cadastrar
    Wait Until Element Is Visible    locator=${Botao_Cadastrar}
    Click Button                     locator=${Botao_Cadastrar}
    Sleep  1s
