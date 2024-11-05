# Diferença entre Lista e Dicionário em Java

### 2. **Java**

- **Lista (ArrayList)**:
  - Em Java, uma **Lista** pode ser representada pela classe `ArrayList`, que é uma implementação dinâmica de lista. Ela é ordenada e acessada via índice, assim como em Python.
  
  **Exemplo**:
  ```java
  import java.util.ArrayList;
  
  ArrayList<Integer> lista = new ArrayList<>();
  lista.add(10);
  lista.add(20);
  lista.add(30);
  System.out.println(lista.get(0));  // Output: 10
  ```

- **Dicionário (HashMap)**:
  - Em Java, o equivalente a um dicionário é um **`HashMap`**, que armazena pares chave-valor. As chaves são únicas, e você acessa os valores utilizando as chaves.

  **Exemplo**:
  ```java
  import java.util.HashMap;
  
  HashMap<String, String> meuMap = new HashMap<>();
  meuMap.put("nome", "João");
  meuMap.put("cidade", "Rio de Janeiro");
  System.out.println(meuMap.get("nome"));  // Output: João
  ```

