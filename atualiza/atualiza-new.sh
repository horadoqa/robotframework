#!/usr/bin/env bash
set -euo pipefail

# =========================
# Funções auxiliares
# =========================
log() {
    echo -e "\n[INFO] $1\n"
}

error() {
    echo -e "\n[ERRO] $1\n" >&2
    exit 1
}

check_command() {
    command -v "$1" >/dev/null 2>&1 || error "$1 não encontrado. Instale antes de continuar."
}

# =========================
# Atualizar Google Chrome
# =========================
log "Atualizando Google Chrome..."

CHROME_DEB="google-chrome.deb"
URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

wget -O "$CHROME_DEB" "$URL" || error "Falha ao baixar Google Chrome."

[[ -f "$CHROME_DEB" ]] || error "Arquivo do Chrome não foi criado."

sudo dpkg -i "$CHROME_DEB" || true
sudo apt -f install -y

rm -f "$CHROME_DEB"

check_command google-chrome

# =========================
# Detectar versão do Chrome
# =========================
CHROME_VERSION_FULL=$(google-chrome --version | awk '{print $3}')
CHROME_MAJOR=$(echo "$CHROME_VERSION_FULL" | cut -d '.' -f 1)

log "Google Chrome atualizado: $CHROME_VERSION_FULL"

# =========================
# Obter versão compatível do ChromeDriver
# =========================
log "Buscando ChromeDriver compatível..."

VERSION=$(wget -qO- "https://googlechromelabs.github.io/chrome-for-testing/LATEST_RELEASE_${CHROME_MAJOR}")

[[ -n "$VERSION" ]] || error "Não foi possível obter versão do ChromeDriver."

CHROME_DRIVER_URL="https://storage.googleapis.com/chrome-for-testing-public/$VERSION/linux64/chromedriver-linux64.zip"

INSTALL_DIR="/usr/bin"

# =========================
# Preparação
# =========================
TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_DIR"' EXIT

log "Removendo versão anterior do ChromeDriver..."
sudo rm -f "$INSTALL_DIR/chromedriver"

# =========================
# Download ChromeDriver
# =========================
log "Baixando ChromeDriver ($VERSION)..."

cd "$TEMP_DIR"
wget -q "$CHROME_DRIVER_URL" -O chromedriver.zip

[[ -f chromedriver.zip ]] || error "Falha ao baixar o ChromeDriver."

# =========================
# Extração
# =========================
log "Descompactando ChromeDriver..."
unzip -q chromedriver.zip

[[ -f chromedriver-linux64/chromedriver ]] || error "Falha ao extrair o ChromeDriver."

# =========================
# Instalação
# =========================
log "Instalando ChromeDriver..."

sudo mv chromedriver-linux64/chromedriver "$INSTALL_DIR/chromedriver"
sudo chmod +x "$INSTALL_DIR/chromedriver"

# =========================
# Verificação final
# =========================
CHROMEDRIVER_VERSION=$(chromedriver --version | awk '{print $2}')
CHROME_VERSION=$(google-chrome --version | awk '{print $3}')

log "Versão ChromeDriver: $CHROMEDRIVER_VERSION"
log "Versão Google Chrome: $CHROME_VERSION"

CHROME_MAJOR_FINAL=$(echo "$CHROME_VERSION" | cut -d '.' -f 1)
DRIVER_MAJOR_FINAL=$(echo "$CHROMEDRIVER_VERSION" | cut -d '.' -f 1)

if [[ "$CHROME_MAJOR_FINAL" != "$DRIVER_MAJOR_FINAL" ]]; then
    error "Incompatibilidade detectada:
Chrome: $CHROME_VERSION
ChromeDriver: $CHROMEDRIVER_VERSION"
fi

# =========================
# Finalização
# =========================
log "Instalação concluída com sucesso!"
log "Google Chrome e ChromeDriver estão compatíveis."