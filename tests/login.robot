*** Settings ***
Documentation           Login tests

Resource               ../resources/main.resource

Test Setup        Start Test
Test Teardown     Finish Test

*** Test Cases ***
Deve logar com sucesso
    [Tags]              login_success
    Go to Login Page
    Submit Credentials        papito@gmail.com    vaibrasil
    User Logged In

Não deve logar com senha incorreta
    [Tags]              inv_pass

    Go to Login Page   
    Submit Credentials        papito@gmail.com    vaibrasil1
    Toast Message Should Be   Credenciais inválidas, tente novamente!