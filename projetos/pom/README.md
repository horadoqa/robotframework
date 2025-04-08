# Como implementar o Page Object Model (POM) no Robot Framework

Neste artigo, discutiremos em detalhes como podemos implementar o Page Object Model no Robot Framework. Vamos nos aprofundar automatizando um cenário simples de Login.

1. Faça login em https://front.serverest.dev/login
2. Verifique se o usuário está conectado com sucesso
3. Faça logout e verifique

Etapa 1: Para nossa implementação, teremos a seguinte estrutura:

```bash
.
├── Resources
│   └── PageObject
│       ├── KeywordDefinationFiles
│       ├── Locators
│       └── TestData
└── pom.md

5 directories, 1 file
```

## Etapa 2: Crie um arquivo Locators.py na pasta Locators. Esse arquivo conterá todos os nossos localizadores.

```bash
# Localizadores de página de login
LoginUsernameInputBox = "id:txtNome de usuário"
LoginPasswordInputBox = "id:txtSenha"
LoginButton = "id:btnLogin"

# Localizadores de página inicial
WelcomeText = "id:welcome"
LogoutButton = "css:[href=" /index.php /auth/logout " ]"
```

## Etapa 3: Crie um arquivo Testdata.py na pasta TestData. Esse arquivo conterá todos os nossos dados de teste.

# Dados de teste da página de login

```bash
email = "horadoqa@teste.com"
password = "1q2w3e4r"
```

## Etapa 4: Crie um arquivo para cada página em seu aplicativo na pasta KeywordDefinationFiles. Para nosso caso de teste, criaríamos 3 arquivos – LoginPage.robot para página de login, HomePage.robot para página inicial e Common.robot para escrever funcionalidades comuns que são independentes de quaisquer páginas.


## Etapa 5: 'LoginPage.robot' conterá todas as funcionalidades que executaremos em nossa página de login.

– Biblioteca SeleniumLibrary : Importando a Biblioteca Selenium para que possamos usar os comandos Selenium no arquivo do robô atual.

– Variáveis ​​../Locators/Locators.py : Importando o arquivo 'Locators.py' para que possamos usar os valores do localizador definidos lá, no arquivo do robô atual.

– Variáveis ​​../TestData/Testdata.py : Importando o arquivo 'Testdata.py' para que possamos usar os dados de teste definidos lá, no arquivo do robô atual.

– Nome de usuário de entrada Texto de entrada ${LoginUsernameInputBox} ${Username} : Estamos criando uma palavra-chave definida pelo usuário 'Input Username' aqui. Abaixo disso, estamos usando o comando 'Input Text' da biblioteca Selenium que recebe dois argumentos – ${LoginUsernameInputBox} e ${Username} . ${LoginUsernameInputBox} é o localizador vindo do arquivo 'Locators.py' e ${Username} são os dados de teste vindos do arquivo 'Testdata.py'.

– Insira a senha Insira o texto ${LoginPasswordInputBox} ${Password} : Da mesma forma, aqui estamos criando uma palavra-chave definida pelo usuário 'Inserir senha' onde inserimos a senha no campo de senha.

– Clique em Login Clique no Elemento ${LoginButton} : Aqui estamos criando uma palavra-chave definida pelo usuário 'Click Login' e abaixo dela estamos escrevendo comandos para clicar no botão 'Login'.
 
## Etapa 6: 'HomePage.robot' conterá todas as funcionalidades que executaremos em nossa página inicial.

– Biblioteca SeleniumLibrary : Importando a Biblioteca Selenium para que possamos usar os comandos Selenium no arquivo do robô atual.

– Variáveis ​​../Locators/Locators.py : Importando o arquivo 'Locators.py' para que possamos usar os valores do localizador definidos lá, no arquivo do robô atual.

– Variáveis ​​../TestData/Testdata.py : Importando o arquivo 'Testdata.py para que possamos usar os dados de teste definidos lá, no arquivo do robô atual.

– Verificar se o texto de boas-vindas está visível O elemento deve estar visível ${WelcomeText} timeout=5 : Aqui estamos criando uma palavra-chave definida pelo usuário 'Verificar se o texto de boas-vindas está visível' e, abaixo dela, estamos escrevendo o comando selenium para aguardar que o elemento de texto de boas-vindas fique visível.

– Sair Clicar no Elemento ${WelcomeText} / Aguardar até que o Elemento fique visível ${LogoutButton} timeout=5 / Clicar no Elemento ${LogoutButton} / Aguardar até que o Elemento fique visível ${LoginUsernameInputBox} timeout=5 : Aqui estamos criando uma palavra-chave definida pelo usuário 'Logout' e, abaixo dela, estamos fazendo quatro coisas – Clicar no texto de Boas-vindas, que abre o menu suspenso. Então estamos esperando o botão Logout ficar visível. Então estamos clicando no botão Logout. E, finalmente, estamos esperando a caixa de entrada do Nome de usuário ficar visível para verificar se o logout ocorreu com sucesso.

## Etapa 7: 'Common.robot' conterá todas as funcionalidades comuns.

```bash
*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Opening Browser
    [Arguments]  ${site_url}  ${browser}
    Open Browser  ${site_url}  ${browser}
    Wait Until Element Is Visible  ${LoginUsernameInputBox}  timeout=5
```

– Biblioteca SeleniumLibrary : Importando a Biblioteca Selenium para que possamos usar os comandos Selenium no arquivo do robô atual.

– Variáveis ​​../Locators/Locators.py : Importando o arquivo 'Locators.py' para que possamos usar os valores do localizador definidos lá, no arquivo do robô atual.

– Variáveis ​​../TestData/Testdata.py : Importando o arquivo 'Testdata.py' para que possamos usar os dados de teste definidos lá, no arquivo do robô atual.

– Abrindo o navegador / [Argumentos] ${site_url} ${browser} / Abrir o navegador ${site_url} ${browser} / Aguardar até que o elemento fique visível ${LoginUsernameInputBox} timeout=5 : Aqui estamos criando uma palavra-chave definida pelo usuário 'Abrindo o navegador' e dentro dela estamos fazendo três coisas – [Argumentos] ${site_url} ${browser} pegará a url do site e o nome do navegador do nosso arquivo de suíte de testes, Abrir o navegador ${site_url} ${browser} abrirá o navegador com a url do site e Aguardar até que o elemento fique visível ${LoginUsernameInputBox} timeout=5 aguardará até que a caixa de entrada do nome de usuário fique visível.
 
## Etapa 8: Agora, finalmente escreveremos nosso teste dentro da pasta 'Testes' – PageObject.robot

```bash
*** Settings ***
Documentation  Page Object in Robot Framework
Library  SeleniumLibrary
Resource  ../Resources/PageObject/KeywordDefinationFiles/LoginPage.robot
Resource  ../Resources/PageObject/KeywordDefinationFiles/HomePage.robot
Resource  ../Resources/PageObject/KeywordDefinationFiles/Common.robot

*** Variables ***
${site_url}  https://opensource-demo.orangehrmlive.com/
${browser}  Chrome

*** Test Cases ***
Verify Successful Login to OrangeHRM
    [documentation]  This test case verifies that the user is able to successfully Login and Logout to OrangeHRM using Page Object
    [tags]  Smoke
    Opening Browser  ${site_url}  ${browser}
    Input Username
    Input Password
    Click Login
    Verify Welcome Text is Visible
    Logout
    Close Browser

*** Keywords ***
```

– Biblioteca SeleniumLibrary : Importando a Biblioteca Selenium para que possamos usar os comandos Selenium no arquivo atual do robô.

– Recurso ../Resources/PageObject/KeywordDefinationFiles/LoginPage.robot : Importe o arquivo 'LoginPage.robot' como um arquivo de recurso para que possamos usar as palavras-chave definidas lá em nosso teste.

– Recurso ../Resources/PageObject/KeywordDefinationFiles/HomePage.robot : Importe o arquivo 'HomePage.robot' como um arquivo de recurso para que possamos usar as palavras-chave definidas lá em nosso teste.

– Resource ../Resources/PageObject/KeywordDefinationFiles/Common.robot : Importe o arquivo 'Common.robot' como um arquivo de recurso para que possamos usar as palavras-chave definidas lá em nosso teste.

– ${site_url} https://opensource-demo.orangehrmlive.com/ | ${browser} Chrome : Duas variáveis ​​definidas aqui. Uma contendo o valor da url do site e a outra contendo o nome do navegador.

– Verificar login bem-sucedido no OrangeHRM : Nome do caso de teste.

– [documentação] Este caso de teste verifica se o usuário consegue efetuar login e logout com sucesso no OrangeHRM usando o objeto de página : Mais detalhes sobre o caso de teste.

– [tags] Smoke : Caso de teste marcado como 'Smoke'.

– Abrindo o navegador ${site_url} ${browser} : As duas variáveis ​​serão passadas como argumentos para a palavra-chave definida pelo usuário 'Abrindo o navegador' no arquivo 'Common.robot', que então abrirá a URL no navegador Chrome.

– Nome de usuário de entrada : palavra-chave definida pelo usuário em 'LoginPage.robot' para inserir o nome de usuário no campo de nome de usuário.

– Senha de entrada : palavra-chave definida pelo usuário em 'LoginPage.robot' para inserir a senha no campo de senha.

– Clique em Login : palavra-chave definida pelo usuário em 'LoginPage.robot' para clicar no botão Login.

– Verificar se o texto de boas-vindas está visível : palavra-chave definida pelo usuário em 'HomePage.robot' para verificar se o texto de boas-vindas está visível.

– Logout : palavra-chave definida pelo usuário em 'HomePage.robot' para executar logout e verificação.

– Close Browser : Este é um comando selenium para fechar o navegador e finalizar o teste.
 
## Etapa 9: Após a execução, devemos ver um 'PASS'.

