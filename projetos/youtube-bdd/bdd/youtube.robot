** Settings **
Resource    keywords.resource

** Test Cases **
Cenário 1: Executar vídeo do site do youtube
    Given access youtube site
    When search for video name
    And click in button search
    And click in first option
    Then the video is play