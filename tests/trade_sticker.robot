*** Settings ***
Documentation  Trade Stickers
Resource    ../resources/main.resource

Test Setup      Start Test
Test Teardown   Finish Test

*** Test Cases ***
Deve poder negociar com um usuário
    [Tags]                      trade_user
    Do Login
    Click Search Sticker Button
    Get in Touch
    Whatsapp Generic Message 

Deve poder negociar uma figurinha específica com um usuário
    [Tags]                      trade_sticker
    Do Login
    
    ${sticker_name}             Set Variable
    ...                         KYLIAN
    
    Search Sticker              ${sticker_name} 
    Select Sticker              ${sticker_name}
    Get in Touch By Sticker
    Whatsapp Sticker Message