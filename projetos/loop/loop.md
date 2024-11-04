# LOOP

2 - Loops com FOR
A sintaxe começa com :FOR e os dois pontos são necessários para separar a sintaxe das keywords normais, a próxima informação é a variável de "incremento" do loop, e a próxima informação deve ser a palavra IN (para listas) ou IN RANGE (para intervalo numérico), por fim são passados os números de início e fim que deseja iterar ou a lista que será percorrida.

2.1 - Loop em uma lista de elementos:


Nesse exemplo tenho uma lista de frutas (@{FRUTAS}) e para cada item dessa lista uma interação é executada, o FOR acaba quando todos os itens (${ITEM}) da lista tiverem sido percorridos.

2.2 - Loop em um intervalo de números:


Nesse exemplo tenho um intervalo de 1 a 6, ou seja, o contador (${COUNT}) irá ser incrementado a cada execução até que as 5 interações acabem. No robot o último número não é contabilizado como uma interação, ou seja, a interação nº 6 não irá ocorrer.


3 - Repetindo uma única keyword várias vezes
O último loop é um pouco diferente, todas as ações são colocadas em uma keyword e nós repetimos essa keyword em um determinado nº de vezes. Obs.: Não é possível interromper o loop antes que todas as iterações tenham sido concluídas.   

#DICA: Essa keyword está descrita na library BuiltIn.



Nesse exemplo a keyword que eu quero que se repita 4 vezes é a "Log     Vamos logar essa frase 4 vezes!!!"

4 - Keywords complementares
Temos mais 2 keywords para auxiliar na implementação com os loops:

Exit For Loop e Exit For Loop If

Elas fazem com que a execução do loop seja interrompido se a condição for verdadeira.

#DICA: Essas keywords também estão descritas na library BuiltIn.



