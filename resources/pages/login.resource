*** Settings ***
Documentation    Login Page

Library          Browser

*** Keywords ***
Go to Login Page
    New Page                   https://trade-sticker-dev.vercel.app

Submit Email
    [Arguments]                ${email}
    Fill Text                  css=input[name="email"]        ${email}

Submit Password
    [Arguments]                ${password}
    Fill Text                  css=input[name="password"]     ${password}

Click Login Button                      
    Click                      css=button >> text=Entrar

Submit Credentials    
    [Arguments]                ${email}                       ${password}                   
    Submit Email               ${email}
    Submit Password            ${password}
    Click Login Button 

Toast Message Should Be
    [Arguments]                ${expected_message}
    ${locator}
    ...                        Set Variable
    ...                        css=.Toastify__toast-body div >> text=${expected_message}
    
    Wait For Elements State    ${locator}                     visible    3