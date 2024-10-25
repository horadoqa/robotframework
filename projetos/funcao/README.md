# Criando um projeto utilizando uma função com Faker

## Instalando bibliotcas

```bash
pip install Faker robotframework
```

## VErificando instalação do FAKER

```bash
pip show Faker
Name: Faker
Version: 30.8.1
Summary: Faker is a Python package that generates fake data for you.
Home-page: https://github.com/joke2k/faker
Author: joke2k
Author-email: joke2k@gmail.com
License: MIT License
Location: /home/rfahham/.local/lib/python3.10/site-packages
Requires: python-dateutil, typing-extensions
Required-by: 
```

## VErificando instalação do  ROBOT

```bash
pip show robotframework
Name: robotframework
Version: 7.1
Summary: Generic automation framework for acceptance testing and robotic process automation (RPA)
Home-page: https://robotframework.org
Author: Pekka Klärck
Author-email: peke@eliga.fi
License: Apache License 2.0
Location: /home/rfahham/.local/lib/python3.10/site-packages
Requires: 
Required-by: robotframework-assertion-engine, robotframework-browser, robotframework-seleniumlibrary
```

## Configurando o robot.pythonpath

Se você está usando um editor como o Visual Studio Code, você pode precisar adicionar o diretório onde faker_library.py está localizado ao caminho do Python no Robot Framework.

No seu arquivo settings.json do projeto, você pode adicionar:

json
Copiar código
"robot.pythonpath": [
    "./path/para/seu/diretorio"
]