*** Settings ***
Library               RequestsLibrary

*** Test Cases ***

Quick Get A JSON Body Test ID 1
    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
    Should Be Equal As Strings    1  ${response.json()}[id]

Quick Get A JSON Body Test ID 2
    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/2
    Should Be Equal As Strings    2  ${response.json()}[id]