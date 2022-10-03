*** Settings ***
Documentation   Search Stickers
Resource    ../resources/main.resource

Test Setup      Start Test
Test Teardown   Finish Test

*** Test Cases ***
Deve retornar uma lista de usuários e suas figurinhas
    [Tags]                      no_sticker
    Do Login
    Click Search Sticker Button
    All Users And Sticker

Deve retornar os usuários que possuem uma figurinha específica
    [Tags]                      sticker
    Do Login
    ${sticker_name}             Set Variable
    ...                         legend

    Search Sticker              ${sticker_name}
    All Users And Sticker


Deve retornar página de erro ao buscar figurinha não cadastrada
    [Tags]                      inv_sticker
    Do Login
    Search Sticker              figurinhanãocadastrada
    No Sticker