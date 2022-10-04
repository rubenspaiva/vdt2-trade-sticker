*** Settings ***
Documentation   Arquivo principal do projeto

Resource    pages/login.resource
Resource    pages/dash.resource

*** Keywords ***
Do Login
    Go to Login Page
    Submit Credentials      papito@gmail.com    vaibrasil
    Click Login Button
    User Logged In

Start Test
    Set Browser Timeout     10s
    New Browser             headless=False


Finish Test
    Sleep                   1
    Take Screenshot