# CREATE

Este código é um teste automatizado que utiliza o **Robot Framework** para interagir com a API **Restful Booker**. O objetivo do teste é criar uma reserva e verificar se as informações da reserva estão corretas após a criação. O teste é dividido em várias etapas, onde são feitas requisições HTTP e verificações para garantir que o sistema está funcionando conforme esperado.

### Explicação das partes do código:

#### **1.*** Settings ***
```robot
Library    RequestsLibrary
Library    Collections
```
- **RequestsLibrary**: Essa biblioteca permite que você faça requisições HTTP diretamente no Robot Framework. Aqui, ela é usada para realizar as requisições `POST` e `GET` para a API.
- **Collections**: Essa biblioteca permite manipular estruturas de dados como listas e dicionários. Ela é usada para criar e manipular dicionários no código.

#### **2.*** Test Cases ***
```robot
Create a Booking at Restful Booker
```
Este é o nome do caso de teste. O caso de teste é responsável por criar uma reserva e verificar se a criação foi bem-sucedida. 

#### **3. Criando o Dicionário de Datas de Reserva**
```robot
${booking_dates}    Create Dictionary    checkin=2022-12-31    checkout=2023-01-01
```
- **Create Dictionary** cria um dicionário chamado `${booking_dates}` contendo as datas de check-in e check-out.
- O check-in será no dia **31 de dezembro de 2022** e o check-out será no **1º de janeiro de 2023**.

#### **4. Criando o Corpo da Requisição (Payload)**
```robot
${body}    Create Dictionary    firstname=Hans    lastname=Gruber    totalprice=200    depositpaid=false    bookingdates=${booking_dates}
```
- **Create Dictionary** é novamente usado, mas agora para criar o corpo da requisição que será enviado com a solicitação HTTP `POST`. 
- O corpo da reserva contém os seguintes dados:
  - **firstname**: `Hans`
  - **lastname**: `Gruber`
  - **totalprice**: `200` (valor total da reserva)
  - **depositpaid**: `false` (indica se o depósito foi pago)
  - **bookingdates**: as datas de check-in e check-out, que foram armazenadas no dicionário `${booking_dates}`.

#### **5. Realizando a Requisição POST**
```robot
${response}    POST    url=https://restful-booker.herokuapp.com/booking    json=${body}
```
- É feita uma requisição `POST` para a API de reservas (URL `https://restful-booker.herokuapp.com/booking`), enviando o corpo da reserva (em formato JSON) como parte do payload.
- O resultado da requisição (a resposta da API) é armazenado na variável `${response}`.

#### **6. Extraindo o `bookingid` da Resposta**
```robot
${id}    Set Variable    ${response.json()}[bookingid]
```
- Após a requisição `POST`, a resposta é presumivelmente um JSON contendo informações sobre a reserva criada, incluindo o campo `bookingid` (ID da reserva).
- Esse valor é extraído e armazenado na variável `${id}`. O `bookingid` é um identificador único gerado pela API para a nova reserva.

#### **7. Armazenando o `bookingid` em uma variável de suíte**
```robot
Set Suite Variable    ${id}
```
- O `bookingid` é armazenado como uma **variável de suíte**. Variáveis de suíte persistem durante toda a execução do conjunto de testes e podem ser usadas por outros casos de teste se necessário.

#### **8. Realizando a Requisição GET**
```robot
${response}    GET    https://restful-booker.herokuapp.com/booking/${id}
```
- Uma requisição `GET` é feita para obter os detalhes da reserva criada, usando o `bookingid` extraído anteriormente para formar a URL.
- O ID da reserva `${id}` é inserido na URL para buscar a reserva específica.

#### **9. Logando a Resposta da Requisição GET**
```robot
Log    ${response.json()}
```
- O conteúdo da resposta da requisição `GET` é registrado no log para fins de depuração. Isso ajuda a ver os dados da reserva retornados pela API.

#### **10. Verificando os Dados da Reserva**
```robot
Should Be Equal    ${response.json()}[lastname]    Gruber
Should Be Equal    ${response.json()}[firstname]    Hans   
Should Be Equal As Numbers    ${response.json()}[totalprice]    200
```
- São feitas verificações para garantir que os dados retornados pela requisição `GET` estejam corretos:
  - O valor de `lastname` deve ser `Gruber`.
  - O valor de `firstname` deve ser `Hans`.
  - O valor de `totalprice` deve ser `200`.
  
O comando `Should Be Equal As Numbers` é usado para comparar o preço total, garantindo que a comparação leve em consideração que o valor é numérico.

#### **11. Verificando se o Dicionário Contém um Valor**
```robot
Dictionary Should Contain Value     ${response.json()}    Gruber
```
- O comando `Dictionary Should Contain Value` verifica se o valor `Gruber` (sob o campo `lastname`) está presente no dicionário da resposta.
- Este comando é uma verificação extra para garantir que o campo `lastname` tenha o valor esperado.

---

### **Resumo do fluxo do teste:**
1. O teste começa criando um dicionário com as datas de check-in e check-out.
2. Em seguida, um corpo de requisição é construído com informações da reserva, como nome, sobrenome, preço total, etc.
3. Uma requisição `POST` é feita para criar a reserva.
4. O ID da reserva (`bookingid`) é extraído da resposta da requisição `POST` e armazenado.
5. Uma requisição `GET` é feita para obter os detalhes dessa reserva recém-criada.
6. O conteúdo da resposta `GET` é registrado no log e várias verificações são feitas para garantir que os dados retornados sejam os mesmos enviados na criação da reserva.

Este teste ajuda a garantir que a criação da reserva no sistema de API está funcionando corretamente e que os dados retornados pela API correspondem aos dados enviados.