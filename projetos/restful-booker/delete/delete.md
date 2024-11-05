# DELETE

Este código é um exemplo de um **teste automatizado** usando o **Robot Framework**, que testa a exclusão de uma reserva na API **Restful Booker**. O teste envolve a autenticação como um administrador para obter um token de autenticação e, em seguida, utilizar esse token para autorizar a exclusão de uma reserva específica.

Vamos analisar o código em partes:

---

### **1. Settings**
```robot
Library    RequestsLibrary
Library    Collections
Suite Setup    Authenticate as Admin
```
- **RequestsLibrary**: Esta biblioteca permite fazer requisições HTTP (como `GET`, `POST`, `DELETE`) de forma fácil, interagindo com a API.
- **Collections**: Essa biblioteca fornece recursos para trabalhar com coleções, como listas e dicionários. Ela é usada aqui para criar dicionários, que são utilizados no envio de dados JSON nas requisições.
- **Suite Setup**: Este comando indica que o **keyword** `Authenticate as Admin` será executado antes de qualquer caso de teste (no início da suíte de testes). Isso serve para realizar a autenticação e garantir que o token de autorização esteja disponível para os testes subsequentes.

### **2. Test Case: Delete Booking**
```robot
Delete Booking
    ${header}    Create Dictionary    Cookie=token\=${token}
    ${response}    DELETE    url=https://restful-booker.herokuapp.com/booking/${id}    headers=${header}
    Status Should Be    201    ${response}
```
- **Delete Booking**: Esse é o nome do caso de teste, responsável por excluir uma reserva.
- **`${header}`**: Criação de um dicionário contendo o cabeçalho da requisição HTTP com o token de autenticação necessário para autorizar a exclusão. O valor do cabeçalho é um cookie `token=${token}`, onde `${token}` será o token obtido na autenticação. A barra invertida (`\`) é usada para escapar o sinal de igual (`=`) e garantir que o formato do cookie seja válido.
  
- **`${response}`**: O comando `DELETE` é usado para enviar uma requisição HTTP para a URL `https://restful-booker.herokuapp.com/booking/${id}`, onde `${id}` é o ID da reserva a ser excluída. O cabeçalho `Cookie=token=${token}` é passado na requisição para autorizar a exclusão, usando o token obtido durante a autenticação.

- **Status Should Be**: Este comando verifica se o código de status da resposta (`${response}`) é **201**. O código de status **201** normalmente indica que o recurso foi criado ou modificado com sucesso. No entanto, no contexto de uma requisição `DELETE`, o código de status esperado pode variar dependendo da implementação da API. Em algumas APIs, `204` pode ser o código esperado para uma exclusão bem-sucedida, mas se o código de status for `201`, isso é o que está sendo verificado aqui.

---

### **3. Keywords: Authenticate as Admin**
```robot
Authenticate as Admin
    ${body}    Create Dictionary    username=admin    password=password123
    ${response}    POST    url=https://restful-booker.herokuapp.com/auth    json=${body}
    Log    ${response.json()}
    ${token}    Set Variable    ${response.json()}[token]
    Log    ${token}
    Set Suite Variable    ${token}
```
- **Authenticate as Admin**: Este **keyword** é responsável por realizar a autenticação na API como um administrador para obter um token de autenticação.
  
- **`${body}`**: Um dicionário é criado com as credenciais do administrador (`username=admin` e `password=password123`), que serão usadas para autenticação.

- **`${response}`**: Uma requisição **`POST`** é feita para a URL `https://restful-booker.herokuapp.com/auth`, enviando as credenciais do administrador no corpo da requisição em formato JSON (`json=${body}`).

- **`Log ${response.json()}`**: O conteúdo da resposta JSON da autenticação é registrado no log. Isso ajuda a depurar e verificar a resposta da API (geralmente, o token é retornado aqui).

- **`${token}`**: O token de autenticação é extraído da resposta JSON usando `${response.json()}[token]` e armazenado na variável `${token}`.

- **`Log ${token}`**: O valor do token é registrado no log, permitindo visualizar o token de autenticação que será usado nas próximas requisições.

- **Set Suite Variable ${token}**: O token é armazenado como uma **variável de suíte**, garantindo que ele seja persistido durante toda a execução dos testes dentro da suíte. Isso é importante, pois o token de autenticação será utilizado nas requisições subsequentes (como no caso de teste para exclusão da reserva).

---

### **Resumo do Fluxo de Execução**

1. **Autenticação como Admin**:
   - O primeiro passo é o **Suite Setup** executar a keyword `Authenticate as Admin`, que autentica um usuário (admin) com as credenciais fornecidas e obtém um **token de autenticação**.
   - Este token é armazenado em uma variável de suíte `${token}`.

2. **Excluir uma Reserva**:
   - No caso de teste `Delete Booking`, o token obtido anteriormente é inserido no cabeçalho da requisição como um cookie (`Cookie=token=${token}`).
   - A requisição `DELETE` é feita para excluir uma reserva específica, identificada pelo `${id}` da reserva. O ID da reserva deve ser previamente fornecido ou configurado.
   - O código de status da resposta é verificado para garantir que a requisição de exclusão tenha sido bem-sucedida (espera-se o código **201**, embora o código esperado deva ser verificado com base na implementação da API).

### **Considerações**
- O código faz a autenticação como administrador e usa o token obtido para realizar ações subsequentes (como a exclusão de uma reserva).
- O token é essencial para garantir que a operação de exclusão de reservas seja autorizada.
- O uso de um **Suite Setup** para a autenticação garante que o token estará disponível para todos os casos de teste dentro da suíte, evitando a necessidade de autenticação repetida em cada caso de teste.

Este código é uma boa prática para testes de API que exigem autenticação, permitindo reutilizar a autenticação e o token durante a execução de múltiplos casos de teste.