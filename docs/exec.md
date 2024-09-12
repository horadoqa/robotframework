# Executando Testes

A Partir de um arquivo já preparado

```bash
ROBOT <nomedo arquivo>.robot
```

Criando pasta com os Resultados

```bash
robot -d results <nome do projeto>
```

## Podemos executar um cenário de um determinado projeto

```bash
robot -t "Cenário 2: <Nome do cenário> <nome do arquivo>.robot"
```

Exemplo

```bash
robot -t "Cenario 1: Test Globo google-globo.robot"
robot -t "Cenario 2: Test Google" google-globo.robot
```

## Executar todos os projetos dentro de um diretório

```bash
robot <nome do diretório>
```

Executar cenários de projetos diferentes, adicionamos TAGS

[Tags]  regressivo

Adicionar a TAG antes da Execução

    ** Test Cases **
    Cenario 1: Test Globo
        [Tags]  regressivo
        Open Globo site
        Close Browser

Para executar 

```bash
robot -i regressivo <nome da pasta>
```

Próximos passo...[Organizando o projeto em arquivos difetentes](organizando.md)



https://github.com/cunhafrederico/robot-realworld

