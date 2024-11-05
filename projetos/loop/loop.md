# LOOP

Documentação: https://robotframework.org/robotframework/latest/libraries/BuiltIn.html#Continue%20For%20Loop

## Loops com FOR

A sintaxe começa com FOR, a próxima informação é a variável de "incremento" do loop, e a próxima informação deve ser a palavra 

- IN (para listas)
- IN RANGE (para intervalo numérico)

Por fim são passados os números de início e fim que deseja iterar ou a lista que será percorrida.

1. Loop em um intervalo de números:

Nesse exemplo tenho um intervalo de 1 a 10, ou seja, o contador (${COUNT}) irá ser incrementado a cada execução até que as 10 interações acabem. No robot o último número não é contabilizado como uma interação, ou seja, a interação nº 11 não irá ocorrer.

2. Loop em uma lista de elementos:

Nesse exemplo tenho uma lista de frutas (@{FRUTAS}) e para cada item dessa lista uma interação é executada, o FOR acaba quando todos os itens (${ITEM}) da lista tiverem sido percorridos.

3. As keywords Exit For Loop e Exit For Loop If são usadas no Robot Framework para controlar a execução de loops, permitindo que você saia de um loop antes que ele termine naturalmente. 

Temos mais 2 keywords para auxiliar na implementação com os loops:

- Exit For Loop
    
    - Função: Essa keyword é usada para sair imediatamente de um loop FOR, independentemente da condição de iteração.

    - Uso: Quando você deseja interromper o loop sem qualquer condição, pode chamá-la a qualquer momento dentro do loop.

- Exit For Loop If
    
    - Função: Esta keyword permite que você saia do loop FOR com base em uma condição específica.
    
    - Uso: Você fornece uma condição, e se essa condição for verdadeira, o loop será encerrado.

Elas fazem com que a execução do loop seja interrompido se a condição for verdadeira.

4. Repetindo uma única keyword várias vezes

O último loop é um pouco diferente, todas as ações são colocadas em uma keyword e nós repetimos essa keyword em um determinado nº de vezes. 

Obs.: Não é possível interromper o loop antes que todas as iterações tenham sido concluídas.

Nesse exemplo a keyword que eu quero que se repita 4 vezes é a "Log     Vamos logar essa frase 4 vezes!!!"

5. WHILE Loop: Permite executar um bloco de código enquanto uma condição for verdadeira.



