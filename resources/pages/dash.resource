*** Settings ***
Documentation   Dashboard Page

Library    Browser
Library    String
Library    Collections

*** Variables ***
${clicked_sticker}
${search_button}        css=button >> text=Buscar
${search_input}         input[placeholder^=Busque]
${button_gitbs}         xpath=//button[@class='active']/../../footer/button

*** Keywords ***
#Verifica se o usuário conseguiu logar e entrou na página de busca
User Logged In
    ${header_title}
    ...                     Set Variable
    ...                     Aquela figurinha incrível a um clique de distância.

    Get Text                css=.header-content strong      equal                                 ${header_title}

Click Search Sticker Button
#Clica no botão de buscar figurinhas
    Click                   ${search_button} 

All Users And Sticker
#Verifica se a busca retornou ao menos 1 resultado
    Wait For Elements State
    ...                     css=#page-user-list > main > article:nth-child(1)
    ...                     visible

Search Sticker
#Preenche o campo de busca com o nome da figurinha e clica no botão de buscar figurinhas
    [Arguments]             ${sticker_name}
    Fill Text               ${search_input}                 ${sticker_name}
    Click Search Sticker Button

Select Sticker
#Seleciona a primeira figurinha que se encaixa com o nome escrito na busca dentre todas retornadas
    [Arguments]             ${sticker_name}
    ${sticker_name}         Convert To Lower Case           ${sticker_name}
    ${stickers}             Get Elements                    xpath=//img[contains(translate(@src, 'ABCDEFGHIJKLMNOPQRSTUVWXYZÁÃÂÉÊÍÎÓÕÔÚÛ', 'abcdefghijklmnopqrstuvwxyzáãâéêíîóõôúû'), "${sticker_name}") or contains(translate(@alt, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${sticker_name}")]/..
    ${sticker}              Get From List                   ${stickers}                           0
    Click                   ${sticker}

Get in Touch By Sticker
#Clica no botão de entrar em contato do usuário da figurinha selecionada
    Click                   ${button_gitbs}

Get in Touch
#Clica no primeiro botão de Entrar em Contato de um usuário
    ${buttons}              Get Elements                    css=button >> text="Entrar em contato"
    ${button}               Get From List                   ${buttons}                            0
    Click                   ${button}                  

No Sticker
#Verifica se a busca inválida vai para a página de erro
    ${error_message}        Set Variable
    ...                     Essa busca não retornou dados!
    
    Wait For Elements State
    ...                     css= .notice-container .error >> text=${error_message}
    ...                     visible

    Get Text                css=.notice-container .error    equal    ${errormessage}

Whatsapp Sticker Message
#Verifica se a nova aba aberta contém uma mensagem de whats com o nome da figurinha selecionada
    ${previous_page}        Switch Page                     NEW
    Switch Page             ${previous_page}
    
    ${sticker_name}         Get Attribute                  xpath=//button[@class='active']/img    alt

    Switch Page             NEW

    ${expected_message}     Set Variable
    ...                     Oi, achei o seu contato no Trade Sticker. Estou interessado(a) na figurinha do ${sticker_name}, bora negociar?

    Wait For Elements State
    ...                     css=p >> text=${expected_message}
    ...                     visible
    ...                     5000

Whatsapp Generic Message
#Verifica se a nova aba aberta contém uma mensagem de whats para negociar figurinhas
    Switch Page             NEW

    ${expected_message}     Set Variable
    ...                     Oi, achei o seu contato no Trade Sticker. Bora negociar figurinhas da copa?

    Wait For Elements State
    ...                     css=p >> text=${expected_message}
    ...                     visible
    ...                     5000