Hoje eu vou mostrar um exemplo de como realizar a conferência dos dados de um arquivo PDF, através da execução de um código Python externo via Library Process. Let's bora?

https://github.com/pdfminer/pdfminer.six

01 - Instalando o código para extração dos dados

```bash
pip install pdfminer.six
```
As Libraries OperatingSystem e Process utilizadas no exemplo não requerem instalação, elas já vem embutidas na instalação do Robot.

02 - Escreva seu código no Robot Framework
Segue abaixo um exemplo de um código usando o PDF Miner, esse exemplo foi feito com base no cenário que funcionou no meu ambiente, talvez seja necessários ajustes para funcionar no seu ambiente.

https://robotizandotestes.blogspot.com/2020/02/season-libraries-ep-08-library-process.html