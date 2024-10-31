# ROBOT

## Dependências

- python
- pip
- robot
- bibliotecas
- google ("O google-chrome e o chromedriver precisam estar sempre na mesma versão")
    - google-chrome
    - chromedriver

### Python

[Página de Downloads do Python](]https://www.python.org/downloads/)

Verificar a versão

```bash
python3 --version
Python 3.10.12
```

## Instalar o PIP

```bash
apt install python3.10-venv
```

Verificar a versão

```bash
pip --version
```

### Isolando ambiente

```bash
python3 -m venv ./venv && source venv/bin/activate
```

Para sair do ambiente virtual 

```bash
deactivate
```

### Instalação do robotframework

```bash
pip install robotframework
```

Verificar a versão

```bash
robot --version

Robot Framework 7.0.1 (Python 3.10.12 on linux)
```

### Bibliotecas no robot

```bash
pip install robotframework-seleniumlibrary
```

### different_libraries

https://docs.robotframework.org/docs/different_libraries/database

### Database Library

```bash
pip install robotframework-databaselibrary
```

### Instalando o webdriver

Ele que faz a manipulação do browser

https://pypi.org/project/webdriver-manager/3.0.0/

```bash
sudo pip install webdriver-manager 
```

## google-chrome

```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
sudo apt install ./google-chrome-stable_current_amd64.deb && \
google-chrome --version
```

## chromedriver

https://googlechromelabs.github.io/chrome-for-testing/

```bash
wget https://storage.googleapis.com/chrome-for-testing-public/130.0.6723.91/linux64/chromedriver-linux64.zip && \
unzip chromedriver-linux64.zip && \
cd chromedriver-linux64 && \
chmod +x chromedriver && \
sudo cp chromedriver /usr/bin/ && \
chromedriver --version
```

Se o local do seu driver ainda não estiver em um diretório listado, você pode adicionar um novo diretório ao PATH:

```bash
echo 'export PATH=$PATH:/usr/bin/chromedriver' >> ~/.zshenv
```

Atualizar o MYOHZSH

```bash
source ~/.zshenv
```

### Instalar a extensão do ROBOT para o VSCODE

No vscode procurar por:

- Robot Framework Language Server
- Robot Code (Daniel Biehl)

Próximo passo... [Estrutura do ROBOT](estrutura.md)