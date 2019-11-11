*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${DEFAULT_URL}          http://ninjaplus-web:5000/login 
${BROWSER}              chrome


#desafio#
#       1 - resolver o problema dos elementos seletores repetidos
#       2 - Implementar campo obrigatorio com Test template



*** Keywords ***
Abrir navegador 
        Open Browser    ${DEFAULT_URL}     ${BROWSER}
        Set Selenium Implicit Wait  10
        Maximize Browser Window
Fechar navegador
        Close Browser


    #### Steps
Fazendo login com "${email}" e com senha "${pass}"
        Input Text      id:emailId      ${email}
        Input Text      id:passId      ${pass}
        Click Button    id:login

Devo ver meu nome "${username}" na área logada
        Wait Until Element Contains     css:.user .info span        ${username}


Devo ver a seguinte mensagem de alerta "${expect_message}"
        #Page Should Contain     ${expect_message}
        Wait Until Element Contains     css:.alert      ${expect_message}





Logando com credenciais invalídas devo ver uma mensagem de alerta

        [Arguments]     ${email}                        ${pass}         ${expect_message}
        Input Text      id:emailId                      ${email}
        
        Input Text      id:passId                       ${pass}
        Click Button    id:login
        Wait Until Element Contains     css:.alert      ${expect_message}
