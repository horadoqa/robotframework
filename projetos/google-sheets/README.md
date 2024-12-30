# GOOGLE SHEETS

Projeto com robot framework para ler um arquivo do google sheets, lendo uma planilha e cadastrando o usuário no site.

Para criar um código no **Robot Framework** que leia dados de um arquivo do **Google Sheets** e cadastre um usuário em um site, você precisará usar algumas bibliotecas e APIs adicionais. 

Vou dividir em etapas para facilitar o entendimento.

### Passos para Implementação:

1. **Configurar a API do Google Sheets** para acesso aos dados da planilha.
2. **Usar a biblioteca `SeleniumLibrary`** para automatizar o processo de cadastro no site.
3. **Criar o script no Robot Framework**, combinando as bibliotecas para ler dados da planilha e interagir com o site.

### 1. Configuração da API do Google Sheets

Antes de criar o código, você precisará configurar a API do Google Sheets para acessar os dados da planilha. Para isso, siga estas etapas:

#### Passo 1: Criar um Projeto no Google Cloud
1. Acesse o [Google Cloud Console](https://console.cloud.google.com/).
2. Crie um novo projeto.
3. Ative a **Google Sheets API** no projeto.
4. Crie uma **credencial de serviço** para acessar a API do Google Sheets.
   - Selecione "Service account" e baixe a chave JSON da conta de serviço.

#### Passo 2: Compartilhar a Planilha
Compartilhe a planilha do Google Sheets com o e-mail da conta de serviço criada (encontrado no arquivo JSON da credencial).

#### Passo 3: Instalar as Bibliotecas Necessárias
Para acessar a API do Google Sheets em Python, você precisa instalar a biblioteca **`gspread`**.

Execute o seguinte comando para instalar as bibliotecas necessárias:

```bash
pip install gspread oauth2client
```

#### Passo 4: Criar um Script Python para Ler Dados do Google Sheets
Crie um arquivo Python para ler os dados da planilha. Aqui está um exemplo básico:

```python
import gspread
from oauth2client.service_account import ServiceAccountCredentials

def get_data_from_sheets(sheet_id, range):
    # Definir o escopo
    scope = ["https://spreadsheets.google.com/feeds", "https://www.googleapis.com/auth/drive"]
    creds = ServiceAccountCredentials.from_json_keyfile_name('path/to/your/credentials.json', scope)
    
    # Autenticar e conectar com o Google Sheets
    client = gspread.authorize(creds)
    
    # Abrir a planilha
    sheet = client.open_by_key(sheet_id).sheet1  # ou use sheet_name
    data = sheet.get_all_records()  # Pega todos os dados como uma lista de dicionários
    return data
```

Este script vai ler os dados de uma planilha do Google Sheets e retorná-los como uma lista de dicionários.

### 2. Usando o Robot Framework com o Python

Agora que você tem um script Python para ler os dados, você pode chamar esse script dentro do Robot Framework usando a **`OperatingSystem`** e a **`Library`** Python.

#### Passo 1: Configurar o Ambiente Robot Framework

No seu arquivo de teste do Robot Framework, você precisa importar a **`OperatingSystem`** e **`SeleniumLibrary`** (para manipular o navegador).

```robot
*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Process
Library           Collections

*** Variables ***
${URL}            https://www.exemplo.com/cadastrar
${SHEET_ID}       seu_id_da_planilha_aqui
${RANGE}          'A2:C10'

*** Test Cases ***

Cadastro de Usuários
    ${dados}=    Obter Dados do Google Sheets
    Para Cada    ${usuario}    Em    ${dados}
        Cadastrar Usuario    ${usuario}[nome]    ${usuario}[email]    ${usuario}[senha]

*** Keywords ***

Obter Dados do Google Sheets
    ${comando}=    python3    path/to/your/script.py    ${SHEET_ID}    ${RANGE}
    ${resultado}=    Run Process    ${comando}    shell=True
    ${resultado}=    Get Process Result    ${comando}
    ${dados}=    Convert To Dictionary    ${resultado.stdout}
    [Return]    ${dados}

Cadastrar Usuario
    [Arguments]    ${nome}    ${email}    ${senha}
    Open Browser    ${URL}    chrome
    Input Text    id=nome    ${nome}
    Input Text    id=email    ${email}
    Input Text    id=senha    ${senha}
    Click Button    id=cadastrar
    Close Browser
```

#### Passo 2: Detalhamento dos Comandos

1. **Obter Dados do Google Sheets**:
   - Usa o comando `Run Process` para executar o script Python que recupera os dados da planilha do Google Sheets.
   - O script Python que você escreveu deve retornar os dados em formato adequado (como JSON ou uma lista de dicionários) para que o Robot Framework possa usá-los.

2. **Cadastrar Usuario**:
   - Para cada linha de dados (nome, email, senha), o Robot Framework usa o **SeleniumLibrary** para preencher o formulário de cadastro no site, inserindo as informações e enviando o formulário.

#### Passo 3: Instalar o Selenium WebDriver

Certifique-se de que você tenha o **WebDriver** adequado instalado para o seu navegador (Chrome, Firefox, etc.). Você pode baixar o ChromeDriver no [site oficial](https://sites.google.com/a/chromium.org/chromedriver/).

### 3. Executando o Script

Após a configuração dos testes e instalação das dependências, basta rodar o seu teste do Robot Framework, que irá automaticamente ler os dados da planilha e preencher o formulário de cadastro no site:

```bash
robot seu_arquivo_de_teste.robot
```

### Considerações Finais:

- **Autenticação da API**: A chave da API (credenciais do Google Sheets) deve estar no caminho correto e ser configurada corretamente para garantir que o acesso à planilha seja autorizado.
- **Segurança**: Certifique-se de que seus dados sensíveis, como senhas, sejam manipulados com segurança durante o teste.
- **Erros de Webdriver**: Garanta que a versão do **WebDriver** seja compatível com a versão do seu navegador.

Essa abordagem combina o **Robot Framework** com **Python** para acessar o Google Sheets e usar o Selenium para interação com o site. Se tiver mais alguma dúvida ou precisar de mais detalhes, fique à vontade para perguntar!