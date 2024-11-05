*** Settings ***
Library    RequestsLibrary

*** Test Cases ***

Quick Get A JSON Body Test ID 1
    ${response}=    GET    https://jsonplaceholder.typicode.com/posts/1
    ${json_body}=   ${response.json()}  # A resposta já é um dicionário Python
    ${title}=       ${json_body['title']}  # Acessa o campo 'title' do dicionário
    Should Be Equal As Strings    sunt aut facere repellat provident occaecati excepturi optio reprehenderit    ${title}
