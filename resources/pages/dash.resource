*** Settings ***
Documentation   Dashboard Page

Library    Browser
Library    String
Library    Collections

*** Keywords ***
User Logged In
    ${header_title}
    ...                     Set Variable
    ...                     Aquela figurinha incrível a um clique de distância.

    Get Text                css=.header-content strong  equal   ${header_title}

Click Search Sticker Button
    Click                   css=button >> text=Buscar

All Users And Sticker
    Wait For Elements State
    ...                     css=#page-user-list > main > article:nth-child(1)
    ...                     visible

Search Sticker
    [Arguments]             ${sticker_name}
    Fill Text               input[placeholder^=Busque]  ${sticker_name}
    Click Search Sticker Button

Select Sticker
    [Arguments]             ${sticker_name}
    ${sticker_name}                 Convert To Lower Case   ${sticker_name}
    ${elements}   Get Elements    xpath=//img[contains(translate(@src, 'ABCDEFGHIJKLMNOPQRSTUVWXYZÁÃÂÉÊÍÎÓÕÔÚÛ', 'abcdefghijklmnopqrstuvwxyzáãâéêíîóõôúû'), "${sticker_name}") or contains(translate(@alt, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${sticker_name}")]/..
    ${elem}    Get From List    ${elements}    0
    Click     ${elem}
    Click     ${elem}../../footer/button
    #Click                   xpath=//img[contains(@alt, "${sticker_name}")]/..
    #//img[@alt="Neymar Jr"]/..
    #Click                   xpath=//img[contains(translate(@src, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${sticker_name}") or contains(translate(@alt, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${sticker_name}")]/.. 

Get in Touch
    Click                   css=button >> text="Entrar em contato"

No Sticker
    ${error_message}     Set Variable
    ...                  Essa busca não retornou dados!
    
    Wait For Elements State
    ...                     css= .notice-container .error >> text=${error_message}
    ...                     visible

    Get Text                css=.notice-container .error    equal    ${errormessage}

Whatsapp Sticker Message
    [Arguments]             ${sticker_name}
    Switch Page             NEW

    ${message}        Get Text              xpath=//*[@id="main_block"]/p

    Should Be Equal    ${message}
    ...                            Oi, achei o seu contato no trade sticker. estou interessado(a) na figurinha do ${sticker_name}, bora negociar?
    ...                            ignore_case=true

    Wait For Elements State
    ...                    xpath=//*[@id="main_block"][contains(translate(@p, 'ABCDEFGHIJKLMNOPQRSTUVWXYZÁÃÂÉÊÍÎÓÕÔÚÛ', 'abcdefghijklmnopqrstuvwxyzáãâéêíîóõôúû'), "${sticker_name}")]
    ...                    visible
    ...                    5000

    #...                     [contains(translate(@src, 'ABCDEFGHIJKLMNOPQRSTUVWXYZÁÃÂÉÊÍÎÓÕÔÚÛ', 'abcdefghijklmnopqrstuvwxyzáãâéêíîóõôúû'), "${expected_message}") or contains(translate(@alt, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${expected_message}")]
    
    