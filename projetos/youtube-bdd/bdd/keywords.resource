** Settings **
Library  SeleniumLibrary

** Variables **
${url}    https://www.youtube.com/
${Input_pesquisa}    //input[@id="search"]
${nome_video}    daily working routine Lofi
${Button_pesquisar}    //*[@id="search-icon-legacy"]
${video}   (//yt-formatted-string[@class="style-scope ytd-video-renderer"])[1]
${verificação}    //*[@id="owner-sub-count"][contains(text(), "subscribers")]

** Keywords **
Given access youtube site
    Open Browser    ${url}    chrome
    Sleep    5s

When search for video name
    Input Text   ${Input_pesquisa}     ${nome_video}
    Sleep    5s

And click in button search
    Click Element    ${Button_pesquisar}

And click in first option
    Wait Until Element Is Visible    ${video}    10
    Click Element     ${video}

Then the video is play
    Sleep    20s
    # Click Button    //*[@id="skip-button:3"]
    Wait Until Element Is Visible    ${verificação}    20
    Element Should Be Visible    ${verificação}
    Sleep    20s
    Close Browser