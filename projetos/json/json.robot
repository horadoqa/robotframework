*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Test Cases ***

Quick Get A JSON Body Test ID 1
    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
    Should Be Equal As Strings    1  ${response.json()}[id]
