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

Submit Email
#Insere ${email} na caixa de email
    [Arguments]                ${email}
    Fill Text                  ${email_input}       ${email}

Submit Password
#Insere ${password} na caixa de password
    [Arguments]                ${password}
    Fill Text                  ${password_input}    ${password}

Click Login Button  
#Insere ${password} na caixa de password                    
    Click                      ${login_button} 

Submit Credentials
#Insere ${email} e ${password} nas suas caixas e clica no botão de login
    [Arguments]                ${email}             ${password}                   
    Submit Email               ${email}
    Submit Password            ${password}
    Click Login Button 

Toast Message Should Be
#Verifica a mensagem do toast que aparece
    [Arguments]                ${expected_message}
    ${toast}
    ...                        Set Variable
    ...                        css=.Toastify__toast-body div >> text=${expected_message}
    
    Wait For Elements State    ${toast}             visible    3