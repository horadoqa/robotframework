# Documentação do projeto

## Chatgpt

Construa testes automatizados com a ferramenta Robot Frameqork, conforme as orientações abaixo:

## Funcionalidade: Cadastro de Dog Walkers

    Ator: Sendo um visitante do site que curte cuidar de pets
    Objetico: Posso fazer meu cadastro como Dog Walker
    Valor de negócio: Para que eu possa ter uma nova fonte de renda com essa atividade

## Modelagem de dados

|--------------------------------------|---------------------------|---------------------------|---------------------------|
| Seletor e atrubuto                   | Nome em Português         | Habilitado                | Obrigatório               |
|--------------------------------------|---------------------------|---------------------------|---------------------------|
| <input[name="name"]>                 | Nome                      | Sim                       | Sim                       |
| <input[name="email"]>                | E-mail                    | Sim                       | Sim                       |
| <input[name="cpf"]>                  | CPF                       | Sim                       | Sim                       |
| <input[name="cep"]>                  | CEP                       | Sim                       | Sim                       |
| <input[name="addressStreet"]>        | Rua                       | Não                       | Sim                       |
| <input[name="addressNumber"]>        | Número                    | Sim                       | Sim                       |
| <input[name="addressDetails"]>       | Complemento               | Sim                       | Não                       |
| <input[name="addressDistrict"]>      | Bairro                    | Não                       | Sim                       |
| <input[name="addressCityUf"]>        | Cidade/UF                 | Não                       | Sim                       |
| <input[type="file"]>                 | Upload documento          | Sim                       | Sim                       |
|--------------------------------------|---------------------------|---------------------------|---------------------------|

## Outros elemento sda págin de cadastro:

Para submeter o formulário de cadastro de dow walker, é importante clicar no botão "Cadastrar"
o uopload do documento será feito com o arquivo document.png

## Cenários de aceite escrito em Gherkin 

Contexto:
    Dado que visito o site DogWalk
    E desejo me tornar Dog Walker

Cenário: Cadastro de dog walker com sucesso
    Quando submeto o formulário de cadastro com os meus dados pessoais
    Então devo ver uam mensagem de sucesso informando que meu cadastro foi para análise

Cenário: CPF incorreto
    Quando submeto o formulário informando um CPF incorreto
    Então devo ver uma mensagem de alerta com o seguinte texto: "CPF inválido"
    
Cenário: E-mail inválido
    Quando submeto o formulário informando um e-mail incorreto
    Então devo ver uma mensagem de alerta com o seguinte texto: "Informe um e-mail válido"

Cenário: Campos obrigatórios
    Quando submeto o formulário sem preencher nenhum dos campos
    Então devo ver mensagens de alerta avisando que os campos "são obrigatórios"


OBS.:

Gherkin, define o contrato entre o negócio e a área técnica (o que vai ser entregue, testado e aprovado para produção)

Técnica do BDD (Desenvolvimento orientado a comportamento ) aplicada com o QA e o PO

Cenários de aceite escrito em Girkin são enviados para o desenvolvedor que criará o sistema com base nos comportamentos e funcionalidades.

Próxima passo, criar os testes automatizados com o Robot Framework



