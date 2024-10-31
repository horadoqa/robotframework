# Caso o Robot para de funcionar

## Verificar as versões das ferramentas

Browser: Google Chrome para a nova versão: Versão 130.0.6723.92 (Versão oficial) 64 bits

O Google Chrome

```bash
google-chrome --version
Google Chrome 130.0.6723.91
```

O ChromeDriver

```bash
chromedriver --version
ChromeDriver 130.0.6723.91 (53ac076783696778ecc8f360ea31765c29c240ad-refs/branch-heads/6723@{#1517})
```

O Selinium

```bash
pip show selenium
Name: selenium
Version: 4.26.0
```

Verificando se o chromedriver está em execução

```bash
ps aux | grep chromedriver
```

Finalizar os Processos: Você pode usar o comando kill seguido do PID. Para finalizar todos os processos de uma vez, use o seguinte comando:

```bash
killall chromedriver
```