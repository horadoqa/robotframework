#!/bin/sh

# Definir variáveis para URL e arquivos
CHROME_DRIVER_URL="https://storage.googleapis.com/chrome-for-testing-public/132.0.6834.160/linux64/chromedriver-linux64.zip"
TEMP_DIR="/tmp/chromedriver-install"
INSTALL_DIR="/usr/bin"

# Função para exibir mensagens
print_message() {
    echo "------------------------------------"
    echo "$1"
    echo "------------------------------------"
}

# Checando se wget e unzip estão instalados
if ! command -v wget > /dev/null 2>&1; then
    echo "wget não encontrado. Instale-o primeiro."
    exit 1
fi

if ! command -v unzip > /dev/null 2>&1; then
    echo "unzip não encontrado. Instale-o primeiro."
    exit 1
fi

# Apagando versão anterior do chromedriver
print_message "APAGANDO VERSÃO ANTERIOR DO CHROMEDRIVER !!!"
sudo rm -rf "$INSTALL_DIR/chromedriver"

# Baixando o arquivo
print_message "BAIXANDO CHROMEDRIVER !!!"
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"
wget "$CHROME_DRIVER_URL"

# Verificando se o arquivo foi baixado com sucesso
if [ ! -f "chromedriver-linux64.zip" ]; then
    echo "Erro: O arquivo chromedriver-linux64.zip não foi baixado corretamente!"
    exit 1
fi

# Descompactando o arquivo
print_message "DESCOMPACTANDO O ARQUIVO CHROMEDRIVER !!!"
unzip chromedriver-linux64.zip

# Verificando se o diretório foi criado e o chromedriver está lá
if [ ! -f "chromedriver-linux64/chromedriver" ]; then
    echo "Erro: O arquivo chromedriver não foi extraído corretamente!"
    exit 1
fi

# Movendo o chromedriver para o diretório de instalação
print_message "MOVENDO CHROMEDRIVER PARA /usr/bin"
sudo mv chromedriver-linux64/chromedriver "$INSTALL_DIR/chromedriver"
sudo chmod +x "$INSTALL_DIR/chromedriver"

# Limpeza
rm -rf "$TEMP_DIR"

# Verificando a versão do chromedriver instalado
print_message "INSTALAÇÃO CONCLUÍDA COM SUCESSO !!!"
chromedriver --version
