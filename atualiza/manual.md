A mensagem que você está recebendo indica que a versão do **ChromeDriver** instalada não é compatível com a versão atual do **Google Chrome** no seu sistema. No seu caso, o **ChromeDriver** instalado é a versão 130.0.6723.91, mas a versão do Chrome detectada é a 132.0.6834.83. A recomendação é atualizar o **ChromeDriver** para a versão 132.0.6834.110 para garantir compatibilidade.

### Como Resolver:

1. **Remover o ChromeDriver Atual**:
   Primeiramente, remova o **ChromeDriver** que está instalado no seu sistema para evitar conflitos.

   Para sistemas Linux ou macOS, use o seguinte comando no terminal:

   ```bash
   sudo rm /usr/bin/chromedriver
   ```

   Para sistemas Windows, se o caminho for `C:\path\to\chromedriver.exe`, você pode simplesmente excluir o arquivo.

2. **Baixar o ChromeDriver Compatível**:
   Você pode fazer o download da versão correta do **ChromeDriver** para a versão 132 do Chrome a partir do site oficial:

   [Baixar ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads)

   https://googlechromelabs.github.io/chrome-for-testing/

   Escolha a versão `132.x.xxxx.x` do ChromeDriver que seja compatível com o seu **Google Chrome**.

3. **Instalar o ChromeDriver**:
   - Se você estiver no Linux ou macOS, extraia o **ChromeDriver** e mova o arquivo para o diretório `/usr/bin` (ou outro diretório de sua preferência, mas é importante garantir que esteja no PATH do seu sistema). Aqui está um exemplo de como fazer isso no terminal:

     ```bash
     wget https://chromedriver.storage.googleapis.com/132.0.6834.110/chromedriver_linux64.zip
     cd chromedriver_linux64
     unzip chromedriver_linux64.zip
     sudo mv chromedriver /usr/bin/chromedriver
     sudo chmod +x /usr/bin/chromedriver
     ```

   - No Windows, extraia o arquivo `.zip` do **ChromeDriver** e coloque o executável `chromedriver.exe` em um diretório incluído no **PATH** do sistema (por exemplo, `C:\Tools\chromedriver\`).

4. **Verificar se Está Tudo Correto**:
   Verifique se a nova versão do **ChromeDriver** foi instalada corretamente executando:

   ```bash
   chromedriver --version
   ```

   Isso deve exibir a versão do **ChromeDriver** que você acabou de instalar. Certifique-se de que ela corresponda à versão recomendada para o seu Chrome (132.x.xxxx.x).

### Testar o Script de Novo:
Depois de realizar as alterações acima, tente rodar novamente seu script do **Robot Framework**. O **ChromeDriver** atualizado deve funcionar corretamente com o seu navegador atual.

Se precisar de mais ajuda ou se algo não funcionar, é só avisar!



# https://googlechromelabs.github.io/chrome-for-testing/