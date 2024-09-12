# ** Settings **
# Library  SeleniumLibrary

# ** Variables **

# ${url}    https://globoplay.globo.com
# ${verificar}    //h3[contains(text(), "Walker")]

# ** Keywords **
# Abrir Site
#     Open Browser    ${url}    chrome

# Procurar por Série
#     Click Element    //*[@id="app"]/div/div/div[1]/div[2]/header/div[3]/div/div/a

# Barra Buscar
#     Input Text    //*[@id="search-bar-input"]    text=walker
#     Wait Until Element Is Visible    ${verificar}    10
#     Element Should Be Visible    ${verificar}

#     //*[@id="splide30-slide01"]/div/a/div
    



# Cenário 1: Acessando o site
#     Abrir Site
#     Procurar por Série
#     Barra Buscar