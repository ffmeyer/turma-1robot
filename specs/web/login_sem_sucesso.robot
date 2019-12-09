*** Settings ***
Documentation   O usuário informa suas credenciais incorretas e é notificado com uma mensagem de alerta
Resource        ../../resources/web/steps/login.robot

Test Template   Logando com credenciais invalídas devo ver uma mensagem de alerta

#Setup => coisas que devem acontecer antes do teste
#TearDown => coisas que devem acontecer depois  do teste
Test Setup      Abrir navegador
Test Teardown   Fechar navegador
#DDT => Data Driven Testing (Teste Criado por Dados)
*** Test Cases ***

Senha inválida              papito@ninjaplus.com        asdfgh          Usuário e/ou senha inválidos
Usuário nao cadastrado      404@yahoo.com               123456          Usuário e/ou senha inválidos
Email nao informado         ${EMPTY}                    abc123          Opps. Cadê o email?
Senha nao informada         papito@ninjaplus.com        ${EMPTY}        Opps. Cadê a senha?
