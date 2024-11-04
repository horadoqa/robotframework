# Executando seus testes no Docker

## Construindo a imagem através do Dockerfile

```bash
docker build -t robot_runner .
```

## Listando a imagem

```bash
docker images
```

## Executando o Robot Framework via Docker com a nossa imagem
Agora o comando ficará grandão, deverá seguir o formato:

```bash
docker run --rm --name execucao_robot -v "diretorio_local":diretorio_container nome_da_imagem:TAG comando que executará os testes do robot
```

O comando acima roda o container (docker run), utilizando a imagem na versão que quero (nome_da_imagem:TAG), mapeando os volumes necessários entre minha máquina e o container (-v "diretorio_local":diretorio_container), executa o comando que passo no final (comando que executará os testes do robot) e, após finalizar, ele remove ("mata") esse container automaticamente (--rm).

Fica mais claro com o exemplo abaixo, veja:

```bash
docker run --rm --name execucao_robot -v "C:\RobotBlog\ExemploDocker\suites":/opt/robotframework/tests -v "C:\RobotBlog\ExemploDocker\results":/opt/robotframework/results robot_runner:latest robot -d /opt/robotframework/results -N "Minha suíte executada no docker!" /opt/robotframework/tests
```

- O argumento amarelo é onde mapeio meus diretórios locais x diretórios do container
- Chamo nossa imagem na versão latest no argumento roxo
- E informo o comando que quero que ele execute DENTRO do container, por isso passo o diretório dos testes de DENTRO do container, veja!!!


