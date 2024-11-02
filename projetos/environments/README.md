# Separando ambientes no Robot Framework com .env

## Vantagens

- Facilidade de Configuração: Permite que você altere facilmente entre ambientes sem modificar o código do teste.
- Segurança: Evita a exposição de credenciais diretamente no código.
- Reusabilidade: Facilita o reuso de testes em diferentes contextos.

Utilizando essa abordagem, você poderá gerenciar diferentes ambientes de forma eficiente e manter seu código de testes limpo e organizado.

## 👨‍💻 TECNOLOGIAS UTILIZADAS

- Python: https://www.python.org/downloads/release/python-3810/
- Poetry: https://python-poetry.org/docs/
- Robot Framework: https://pypi.org/project/robotframework/
- Python DotEnvy: https://pypi.org/project/python-dotenv/
- VSCode: https://code.visualstudio.com/download
    - Plugin:
        - Robot Framework Language Server: https://marketplace.visualstudio.com/items?itemName=robocorp.robotframework-lsp
        - Python: https://marketplace.visualstudio.com/items?itemName=ms-python.python


## 🖥️ CONFIGURAÇÃO DO POETRY

[![POETRY](https://img.youtube.com/vi/1z4JDp-Ky9g/0.jpg)](https://www.youtube.com/watch?v=1z4JDp-Ky9g)


## 🦾 INSTALANDO DEPENDÊNCIAS DO PROJETO

``` bash
pip install poetry 
```

## Executando

DEV (está definido em base.resource)

``` bash
robot .
``` 

QA

``` bash
robot -v ENVIRONMENT:qa .
```


PROD

``` bash
robot -v ENVIRONMENT:prod .
``` 