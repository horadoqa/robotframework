*** Settings ***
Library                     Collections
Library                     CSVLibrary

*** Variables ***
${path}    projetos/csv/dados.csv
    
*** Test Cases ***
Read csv file to a dict example test
    @{dict}=    read csv file to associative  ${path}
    ${name} =    Get From Dictionary    ${dict[1]}    name
    ${email} =    Get From Dictionary    ${dict[1]}    email
    ${phone} =    Get From Dictionary    ${dict[1]}    phone

    Log    Nome da segunda linha: ${name}
    Log    Email da segunda linha: ${email}
    Log    Phone da segunda linha: ${phone}

