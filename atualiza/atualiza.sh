#!/bin/sh

# Definir variáveis para URL e arquivos
CHROME_DRIVER_URL="https://storage.googleapis.com/chrome-for-testing-public/146.0.7680.80/linux64/chromedriver-linux64.zip"
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

google-chrome --version

# A versão do chromedriver deve ser compatível com a versão do Google Chrome instalada no sistema. Certifique-se de que ambos estejam atualizados para evitar problemas de compatibilidade.

chromedriver --version == Google Chrome --version

# chromedriver --version
# ChromeDriver 146.0.7680.80 (f08938029c887ea624da7a1717059788ed95034d-refs/branch-heads/7680_65@{#34})


# google-chrome --version
# Google Chrome 146.0.7680.80 

# Faca essa comparação para garantir que a versão do chromedriver seja compatível com a versão do Google Chrome instalada. Se as versões não forem compatíveis, você pode enfrentar problemas ao executar testes automatizados com o Selenium.