*** Settings ***
Library    FakerLibrary

*** Test Cases ***
FakerLibrary Words Generation
    ${words}=    FakerLibrary.Words
    Log    words: ${words}
    ${words}=    FakerLibrary.Words    nb=${10}
    Log    words: ${words}