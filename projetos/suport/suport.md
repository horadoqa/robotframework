# Caso o Robot para de funcionar

## Verificar as versões das ferramentas

Browser: Google Chrome para a nova versão: Versão 130.0.6723.92 (Versão oficial) 64 bits

O Google Chrome

```bash
google-chrome --version
Google Chrome 148.0.7778.215
```

O ChromeDriver

```bash
chromedriver --version
ChromeDriver 148.0.7778.178 (d096af1c9e98c45c3596e59620622b1a049bfecb-refs/branch-heads/7778@{#3196})
```

O Selinium

```bash
pip show selenium

pip show selenium
Name: selenium
Version: 4.25.0
Summary: Official Python bindings for Selenium WebDriver
Home-page: https://www.selenium.dev
Author: 
Author-email: 
License: Apache 2.0
Location: /usr/local/lib/python3.10/dist-packages
Requires: certifi, trio, trio-websocket, typing_extensions, urllib3, websocket-client
Required-by: robotframework-seleniumlibrary
```

Verificando se o chromedriver está em execução

```bash
ps aux | grep chromedriver
```

Finalizar os Processos: Você pode usar o comando kill seguido do PID. Para finalizar todos os processos de uma vez, use o seguinte comando:

```bash
killall chromedriver
```