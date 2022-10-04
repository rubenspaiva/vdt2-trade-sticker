*** Settings ***
Documentation    Login Page

Library    Browser

*** Variables ***
${email_input}        css=input[name="email"] 
${password_input}     css=input[name="password"]
${login_button}       css=button >> text=Entrar

*** Keywords ***

Go to Login Page
#Abre a página do site https://trade-sticker-dev.vercel.app
    New Page                   https://trade-sticker-dev.vercel.app

Click Login Button  
#Insere ${password} na caixa de password                    
    Click                      ${login_button} 

Submit Credentials
#Insere ${email} e ${password} nas suas caixas e clica no botão de login
    [Arguments]                ${email}             ${password}                   
    Fill Text                  ${email_input}       ${email}
    Fill Text                  ${password_input}    ${password}

Toast Message Should Be
#Verifica a mensagem do toast que aparece
    [Arguments]                ${expected_message}
    ${toast}
    ...                        Set Variable
    ...                        css=.Toastify__toast-body div >> text=${expected_message}
    
    Wait For Elements State    ${toast}             visible    3