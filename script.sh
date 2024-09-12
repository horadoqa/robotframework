#!/bin/bash

sudo apt install python3.10-venv
python3 -m venv ./venv && source venv/bin/activate

sudo pip install robotframework
sudo pip install webdriver-manager 
sudo pip install robotframework-seleniumlibrary

echo "Versão do Python"
python3 --version

echo "Versão do PIP"
pip --version

echo "Versão do Robot"
robot --version