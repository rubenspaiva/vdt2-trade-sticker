*** Settings ***
Documentation   Login tests

Resource    ../resources/main.resource

Test Setup      Start Test
Test Teardown   Finish Test

***Variables***
${email}                papito@gmail.com
${password}             vaibrasil
${inv_email}            emailincorreto@gmail.com
${inv_password}         brasilxalemanha
${inv_credentials}      Credenciais inválidas, tente novamente!

*** Test Cases ***
Não deve logar sem inserir email e senha
    [Tags]                    no_email_pass
    Go to Login Page   
    Click Login Button  
    Toast Message Should Be   Por Favor, informe suas credenciais!

Não deve logar usando somente email
    [Tags]                    no_pass
    Go to Login Page   
    Submit Credentials        ${email}      ${EMPTY} 
    Click Login Button   
    Toast Message Should Be   Por Favor, informe a sua senha secreta!

Não deve logar usando somente senha
    [Tags]                    no_email
    Go to Login Page   
    Submit Credentials        ${EMPTY}      ${password}
    Click Login Button   
    Toast Message Should Be   Por Favor, informe o seu email!

Não deve logar usando email inválido e senha válida
    [Tags]                    inv_email
    Go to Login Page   
    Submit Credentials        ${inv_email}      ${password}
    Click Login Button  
    Toast Message Should Be   ${inv_credentials}

Não deve logar usando email válido e senha inválida
    [Tags]                    inv_pass
    Go to Login Page   
    Submit Credentials        ${email}          ${inv_password}
    Click Login Button  
    Toast Message Should Be   ${inv_credentials}

Deve logar usando email e senha válidos
    [Tags]                    login_success
    Go to Login Page
    Submit Credentials        ${email}          ${password}
    Click Login Button  
    User Logged In