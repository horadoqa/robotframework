** Settings **
Resource    keywords.resource

** Test Cases **
Cenário 1: Campo Vazio
    Abrir site
    Campo Vazio
    Fechar Site

Cenário 2: Inserir e-mail válido mas senha inválida
    Abrir site
    E-mail Válido e Senha Inválida
    Fechar Site

Cenário 3: Inserir e-mail inválido mas senha válida
    Abrir site
    E-mail Inválido e Senha Válida
    Fechar Site

Cenário 4: Inserir e-mail e senha inválidos
    Abrir site
    Ambos Inválidos
    Fechar Site

Cenário 5: Inserir e-mail e senha válidos
    Abrir site
    Ambos Válidos
    Fechar Site