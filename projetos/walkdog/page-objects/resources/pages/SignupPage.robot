*** Settings ***
Documentation    Arquivo que representa a página de cadastro com ações e elementos

Library    SeleniumLibrary

*** Keywords ***
Fill signup form
    [Arguments]    ${name}    ${email}    ${cpf}    ${cep}    ${number}    ${details}

    Input Text    css=input[name="name"]             ${name}
    Input Text    css=input[name="email"]            ${email}
    Input Text    css=input[name="cpf"]              ${cpf}
    Input Text    css=input[name="cep"]              ${cep}
    Input Text    css=input[name="addressNumber"]    ${number}
    Input Text    css=input[name="addressDetails"]   ${details}
    Choose File   css=input[type="file"]             ${EXECDIR}/fixtures/document.png

Submit signup form
    Click Element    //button[contains(text(), "Cadastrar")]

Popup have text
    [Arguments]    ${expected_text}

    ${element}    Set Variable    xpath=//div[@class="swal2-html-container"]

    Wait Until Element Is Visible    ${element}    5s
    Element Should Contain           ${element}    ${expected_text}

Alert have text
    [Arguments]    ${expected_text}

    ${element}    Set Variable    xpath=//span[@class="alert-error"][text()="${expected_text}"]

    Wait Until Element Is Visible    ${element}    5s
    Capture Element Screenshot       ${element}