# Suite-test

Dentro do projeto que tenha mais de um "cenário":

Testando o primeiro cenário:

```bash
robot -t "Cenario 1: Test Globo" google-globo.robot
```

Testando o segundo :

```bash
robot -t "Cenario 2: Test Google" google-globo.robot
```

Executar todos os testes que estão dentro de um diretório:

Passar o nome do diretório

```bash
robot google-globo
```

Passando o `-d results` cria uma pasta com os esultados

Utilizando TAGs

Executa somente os cenários que tem a TAG

cenário1: Validar página
    [tags]  <nome da tag>

```bash
robot -i <nome da tag> <nome do diretorio>
```

