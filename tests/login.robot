*** Settings ***
Documentation                 Login tests

Resource                      ../resources/main.resource

Test Setup                    Start Test
Test Teardown                 Finish Test

***Variables***
${email}                      papito@gmail.com
${password}                   vaibrasil
${inv_credentials}            Credenciais inválidas, tente novamente!

*** Test Cases ***
Deve logar usando email e senha válidos
    [Tags]                    login_success
    Go to Login Page
    Submit Credentials        ${email}                    ${password}
    User Logged In

Não deve logar usando email inválido e senha válida
    [Tags]                    inv_email
    Go to Login Page   
    Submit Credentials        emailincorreto@gmail.com    ${password}
    Toast Message Should Be   ${inv_credentials}

Não deve logar usando email válido e senha inválida
    [Tags]                    inv_pass
    Go to Login Page   
    Submit Credentials        ${email}                    brasilxalemanha
    Toast Message Should Be   ${inv_credentials}

Não deve logar usando somente senha válida
    [Tags]                    no_email
    Go to Login Page   
    Submit Password           ${password}
    Click Login Button   
    Toast Message Should Be   Por Favor, informe o seu email!

Não deve logar usando somente email válido
    [Tags]                    no_pass
    Go to Login Page   
    Submit Email              ${email} 
    Click Login Button   
    Toast Message Should Be   Por Favor, informe a sua senha secreta!

Não deve logar sem inserir email e senha
    [Tags]                    no_email_pass
    Go to Login Page   
    Click Login Button  
    Toast Message Should Be   Por Favor, informe suas credenciais!