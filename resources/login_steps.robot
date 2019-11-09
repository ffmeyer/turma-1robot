*** Settings ***
Library     SeleniumLibrary

*** Keywords ***

    #### Steps
Fazendo login com "${email}" e com senha "${pass}"
        Open Browser    http://ninjaplus-web:5000/login     chrome
        Maximize Browser Window
        Input Text      id:emailId      ${email}
        Input Text      id:passId      ${pass}
        Click Button    id:login
        Sleep           5
Devo ver meu nome "${username}" na área logada
        Page Should Contain     ${username}
        Close Browser