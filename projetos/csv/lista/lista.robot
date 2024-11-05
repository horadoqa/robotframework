*** Settings ***
Library                     Collections
Library                     CSVLibrary

*** Variables ***
${path}    projetos/csv/dados.csv
    
*** Test Cases ***
Read csv file to a list example test
  @{list}=  read csv file to list    ${path}
  Log  ${list[1]}
  Log  ${list[2]}
  Log  ${list[3]}
  Log  ${list[4]}

Read csv file to a list example test 2
    # Lê o arquivo CSV e converte em uma lista de listas
    @{list}=  Read CSV File To List    ${path}
    
    # Acessa o nome, email e telefone da primeira pessoa (Joao)
    ${nome} =    Get From List    ${list[3]}    0
    ${email} =    Get From List    ${list[3]}    1
    ${phone} =    Get From List    ${list[3]}    2
    
    Log    Nome: ${nome}
    Log    Email: ${email}
    Log    Telefone: ${phone}