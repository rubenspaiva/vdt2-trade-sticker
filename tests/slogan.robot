*** Settings ***
Documentation          Home page
Resource               ../resources/main.resource

Test Setup        Start Test
Test Teardown     Finish Test

*** Variables ***
${slogan}           Conectando colecionadores de figurinhas da copa.

*** Test Cases ***
Deve validar o slogan da home page
    Go to Login Page
    Get Text        css=.logo-container h2    equal    ${slogan}