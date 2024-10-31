** Settings **
Library  SeleniumLibrary
Library  FakerLibrary

** Variables **

${url_site}    https://demoqa.com/automation-practice-form
${browser}    chrome
${First_Name}    //*[@id="firstName"]
${Last_Name}    //*[@id="lastName"]
${id_Email}    //*[@id="userEmail"]
${Mobile_Number}    //*[@id="userNumber"]
${id_Adress}    //*[@id="currentAddress"]
 

** Keywords **
Dado que acesso o formulário
    Open Browser    ${url_site}    ${browser}

Então o formulário deve ser preenchido
    Wait Until Element Is Visible    ${First_Name}    10s
    ${nome}    FakerLibrary.First Name
    Log    Nome gerado: ${nome}
    Input Text    ${First_Name}    ${nome}
    
    ${sobrenome}    FakerLibrary.Last Name
    Log    Sobrenome gerado: ${sobrenome}
    Input Text    ${Last_Name}    ${sobrenome}
    
    ${email}    FakerLibrary.Email
    Log    Email gerado: ${email}
    Wait Until Element Is Visible    ${id_Email}    15s
    Input Text    ${id_Email}    ${email}
    
    ${phone}    FakerLibrary.Phone Number
    Log    Telefone gerado: ${phone}
    Input Text    ${Mobile_Number}    ${phone}
    
    ${address}    FakerLibrary.Address
    Log    Endereço gerado: ${address}
    Input Text    ${id_Adress}    ${address}


Fechar Browser
    Close Browser
    

** Test Cases **
Cenário: Preenchendo formulário com Faker
    Dado que acesso o formulário
    Então o formulário deve ser preenchido
    Fechar Browser
    
