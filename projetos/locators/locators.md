# Locators

Estratégias básicas para localizar um elemento WEB

## Identificação simples dos locators:

Pelo ID            
  Exemplo:  Click Element    id=Theld ou: Click Element    Theld 

Pelo Nome         
  Exemplo:  Click Element    name=Blink   ou: Click Element    Blink 

Pelo Texto do Link    
  Exemplo:  Click Link    link=Your site.com ou: Click Link    Your Site.com 

Pelo Texto parcial do link  
  Exemplo:  Click Link     partial link=Site.com 

Pelo XPATH 
  Exemplo:  Click Link     xpath=//a[@id='Theld'] 

Pelo CSS 
  Exemplo:  Click Link     css=a[id='Theld'] 

Pelo DOM 
  Exemplo:  Click Element     dom=document.images[5] 

Pela Tag
  Exemplo:  Click Element     tag=div

## Explorando o CSS e XPATH para locators dinâmicos ou complexos:

Contendo um texto
  Exemplo:  Click Element     xpath=//*[contains(text(), "exemplo")]

Contendo um valor
  Exemplo:  Click Element     xpath=//input[contains(@type, 'Submit')]
  Exemplo:  Click Element     css=input[type*='Submit']

Iniciando por um valor 
  Exemplo:  Click Element     xpath=//input[starts-with(@type, 'Submit')] 
  Exemplo:  Click Element     css=input[type^='Submit'] 

Terminando por um valor 
  Exemplo:  Click Element     xpath=//input[ends-with(@type, 'Submit')] 
  Exemplo:  Click Element     css=input[type$='Submit'] 