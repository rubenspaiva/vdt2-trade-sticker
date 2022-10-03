*** Settings ***
Documentation   Home page
Resource    ../resources/main.resource

Test Setup      Start Test
Test Teardown   Finish Test

*** Variables ***
${slogan}       Conectando colecionadores de figurinhas da copa.

*** Test Cases ***
Deve validar o slogan da home page
    [Tags]                  slogan
    Go to Login Page
    
    Wait For Elements State
    ...                     css=.logo-container h2 >> text=${slogan}
    ...                     visible