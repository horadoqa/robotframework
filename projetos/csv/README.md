# Trabalhando com CSV

Neste projeto, é fundamental ter conhecimento prévio de algumas dependências para trabalhar de forma eficaz com arquivos CSV.

## O que é CSV?

**CSV (Comma Separated Values)**, ou **Valores Separados por Vírgula**, é um formato de arquivo simples e amplamente utilizado para armazenar dados tabulares. Ele é utilizado para representar dados em formato de texto simples, em que cada linha contém um registro, e os valores são separados por um delimitador, geralmente a vírgula (`,`). Este formato é especialmente útil para exportar e importar dados entre sistemas, como planilhas e bancos de dados, por ser facilmente legível tanto por humanos quanto por máquinas.

O CSV é muito utilizado em diversas aplicações, desde armazenamento de listas de dados simples até intercâmbio de grandes volumes de informações entre diferentes sistemas.

### Exemplo de um arquivo CSV:
```csv
nome,email,telefone
João,joao@exemplo.com,21987654321
Maria,maria@exemplo.com,2198765432
José,jose@exemplo.com,21987654321
```

### Características do CSV:
- **Formato Simples**: Fácil de criar, ler e manipular, tanto manualmente quanto programaticamente.
- **Estrutura de Dados Tabular**: Armazena os dados em linhas e colunas, facilitando a visualização e manipulação.
- **Compatibilidade**: Pode ser aberto por várias ferramentas, como planilhas (Excel, Google Sheets), editores de texto, e até bancos de dados.

Apesar de sua simplicidade, o formato CSV é eficiente para armazenar e trocar grandes quantidades de dados tabulares, mas tem limitações, como a falta de suporte para tipos de dados complexos e para metadados.

## Listas e Dicionários em Python

No contexto de programação, **listas** e **dicionários** são dois tipos de estrutura de dados fundamentais.

- **Listas** são coleções ordenadas de elementos, acessíveis por índices. Elas são úteis quando a ordem dos dados é importante.
- **Dicionários** são coleções de pares chave-valor, onde os dados são acessados usando uma chave única. Eles são ideais para situações em que você precisa de acesso rápido e direto aos valores associados a uma chave específica.

Cada linguagem de programação oferece suas próprias implementações de listas e dicionários. Abaixo estão links que explicam as diferenças nas principais linguagens de programação:

- [Python](./diferencas/python.md)
- [JavaScript](./diferencas/javascript.md)
- [Java](./diferencas/java.md)
- [C#](./diferencas/c.md)
- [Ruby](./diferencas/ruby.md)
- [PHP](./diferencas/php.md)

## Trabalhando com CSV no Robot Framework

O **Robot Framework** é uma poderosa ferramenta de automação de testes e RPA (Automação de Processos Robóticos) que possui uma biblioteca dedicada chamada **CSVLibrary**. Esta biblioteca facilita o trabalho com arquivos CSV, fornecendo **keywords** que permitem ler, escrever e manipular dados CSV de forma simples e eficiente, sem a necessidade de lidar diretamente com strings.

### Principais funcionalidades da CSVLibrary:
- Leitura de arquivos CSV e conversão para listas ou dicionários.
- Escrita de dados em arquivos CSV.
- Manipulação simples dos dados extraídos de arquivos CSV.

Isso torna o trabalho com CSV muito mais estruturado e reduz a complexidade em comparação com manipulações manuais de texto.

### Instalação da CSVLibrary

Para começar a utilizar a biblioteca **CSVLibrary** no seu projeto com o Robot Framework, basta instalar o pacote via pip:

```bash
pip install robotframework-csvlibrary
```

Com a **CSVLibrary** instalada, você poderá utilizar suas keywords para manipular arquivos CSV de forma prática e eficiente em seus testes e automações.

---

Essa versão oferece uma explicação mais clara e fluida sobre o que é o CSV, sua importância, e como utilizá-lo no contexto do Robot Framework. Ela também faz um link mais claro entre as funcionalidades da biblioteca e como ela facilita a manipulação de arquivos CSV.