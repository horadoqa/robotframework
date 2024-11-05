# Diferença entre Lista e Dicionário em C#

### 3. **C#**

- **Lista (List)**:
  - Em C#, uma lista é representada pela classe **`List<T>`**, que é genérica e permite armazenar elementos de qualquer tipo. Como em Java, ela é ordenada e acessada por índice.

  **Exemplo**:
  ```csharp
  List<int> lista = new List<int> { 10, 20, 30, 40 };
  Console.WriteLine(lista[0]);  // Output: 10
  ```

- **Dicionário (Dictionary)**:
  - Em C#, o equivalente a um dicionário é o **`Dictionary<TKey, TValue>`**, que armazena pares chave-valor. As chaves são únicas e você pode acessar os valores pela chave.

  **Exemplo**:
  ```csharp
  Dictionary<string, string> meuDict = new Dictionary<string, string>();
  meuDict["nome"] = "João";
  meuDict["cidade"] = "Rio de Janeiro";
  Console.WriteLine(meuDict["nome"]);  // Output: João
  ```

