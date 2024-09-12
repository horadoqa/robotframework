# Testes Automatizados de Banco de Dados com Robot Framework.

##Dependências

```bash
sudo pip install robotframework-databaselibrary
pip install psycopg2-binary
```

Entendendo o Código:

1. Definindo as Configurações Básicas

*** Settings ***
Library DatabaseLibrary

O que isso faz?
Essa linha diz ao Robot Framework que vamos usar a DatabaseLibrary, uma biblioteca que facilita a conexão e manipulação de bancos de dados. Com ela, podemos executar comandos SQL diretamente nos testes.

2. Configurando Variáveis

*** Variables ***
--{DB_NAME} test_validacao_banco
--{DB_USER} test_usuario
--{DB_PASS} test_senha
--{DB_HOST} endereco_banco_dados
--{DB_PORT} 5432 # Porta padrão para PostgreSQL

Por que usamos variáveis?
As variáveis tornam o código mais organizado e fácil de manter. Aqui, definimos os parâmetros de conexão, como o nome do banco de dados, usuário, senha, endereço do banco, e a porta de conexão. Dessa forma, se algum desses parâmetros mudar, podemos atualizar facilmente em um único lugar.

3. O Teste em Si

Connect To Database: Aqui, estamos estabelecendo uma conexão com o banco de dados usando o driver psycopg2 (específico para PostgreSQL). Usamos as variáveis que configuramos para passar os detalhes da conexão.

Query: Essa linha executa uma consulta SQL para buscar informações na tabela chamada tabela_exemplo onde o id é igual a 1. O resultado da consulta é armazenado na variável --{resultado}.

Log: Essa linha simplesmente registra o resultado da consulta para que possamos ver no console ou no relatório de testes. Isso ajuda a verificar se o que foi retornado pelo banco está de acordo com o esperado.

Disconnect From Database: Fechamos a conexão com o banco de dados. Isso é uma boa prática para garantir que não deixemos conexões abertas desnecessariamente, o que poderia consumir recursos do sistema.
