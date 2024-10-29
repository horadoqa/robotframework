# Teste de LOGIN

## Objetivo

O objetivo deste projeto é testar a página de Login e validar se todas as opções para erro e sucesso estão funcionando corretamente.

## Cenários de Teste

1. **Campo Vazio**: Não inserir dados, tentar acessar a próxima página `WELCOME` e receber a mensagem informando que os dados precisam ser preenchidos.
   
2. **E-mail Válido e Senha Inválida**: Inserir um e-mail válido, mas uma senha inválida, e tentar acessar a próxima página `WELCOME`, recebendo a mensagem de que os dados são inválidos (e-mail ou senha).

3. **E-mail Inválido e Senha Válida**: Inserir um e-mail inválido, mas uma senha válida, e tentar acessar a próxima página `WELCOME`, recebendo a mensagem de que os dados são inválidos (e-mail ou senha).

4. **Ambos Inválidos**: Inserir um e-mail e uma senha inválidos e tentar acessar a próxima página `WELCOME`, recebendo a mensagem de que os dados são inválidos (e-mail ou senha).

5. **Ambos Válidos**: Inserir um e-mail e uma senha válidos e tentar acessar a próxima página `WELCOME`, tendo acesso à página.

## Considerações Finais

Este projeto fornece uma base para validar a funcionalidade de autenticação em aplicações web e pode ser utilizado para integrar testes automatizados.