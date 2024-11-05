*** Settings ***
Library                     Collections
Library                     CSVLibrary

*** Variables ***
${path}    projetos/csv/dados.csv
    
*** Test Cases ***
Read csv file to a dict example test
    @{dict}=    read csv file to associative  ${path}
    ${name} =    Get From Dictionary    ${dict[2]}    name
    ${email} =    Get From Dictionary    ${dict[2]}    email
    ${phone} =    Get From Dictionary    ${dict[2]}    phone

    Log    Nome: ${name}
    Log    Email: ${email}
    Log    Phone: ${phone}

