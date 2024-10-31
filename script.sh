#!/bin/bash

sudo apt install python3.10-venv
python3 -m venv ./venv
source venv/bin/activate

sudo pip install robotframework webdriver-manager robotframework-seleniumlibrary selenium

echo "Versão do Python"
python3 --version

echo "Versão do PIP"
pip --version

echo "Versão do Robot"
robot --version

echo "Versão do Selenium"
pip show selenium