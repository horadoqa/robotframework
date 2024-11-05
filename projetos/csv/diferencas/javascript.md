# Diferença entre Lista e Dicionário em JavaScript

As definições de **listas** e **dicionários** que descrevi são características típicas de **Python**, mas os conceitos gerais de coleções de dados, como listas e dicionários, se aplicam a muitas outras linguagens de programação, embora os detalhes de implementação e a terminologia possam variar de uma linguagem para outra. Vamos ver como isso se aplica a algumas outras linguagens populares:

### 1. **JavaScript**

- **Lista (Array)**:
  - Em JavaScript, o conceito de "lista" é representado por **arrays**. Arrays em JavaScript são **ordenados** e acessados via índice (geralmente numérico, começando de 0). Eles podem armazenar qualquer tipo de dado e, como Python, são mutáveis.
  
  **Exemplo**:
  ```javascript
  let lista = [10, 20, 30, 40];
  console.log(lista[0]);  // Output: 10
  ```

- **Dicionário (Object)**:
  - O equivalente a um "dicionário" em JavaScript é um **objeto** (ou mais precisamente um **Map**, em versões mais recentes). Um objeto é uma coleção de pares chave-valor, e você pode acessar os valores usando a chave (geralmente uma string ou símbolo).
  
  **Exemplo**:
  ```javascript
  let meuObj = {
    nome: "João",
    idade: 30,
    cidade: "Rio de Janeiro"
  };
  console.log(meuObj["nome"]);  // Output: João
  ```

  Ou usando a nova estrutura **Map**:
  ```javascript
  let meuMap = new Map();
  meuMap.set("nome", "João");
  meuMap.set("idade", 30);
  console.log(meuMap.get("nome"));  // Output: João
  ```

