*** Settings ***
Documentation  Trade Stickers
Resource    ../resources/main.resource

Test Setup      Start Test
Test Teardown   Finish Test

*** Test Cases ***
Deve poder negociar uma firurinha específica com um usuário
    [Tags]                      trade_sticker
    Do Login
    ${sticker_name}             Set Variable
    ...                         messi
    Search Sticker              ${sticker_name} 
    Select Sticker              ${sticker_name} 
    Whatsapp Sticker Message    ${sticker_name} 