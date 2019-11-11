*** Settings ***
Documentation   O usuário informa suas credenciais incorretas e é notificado com uma mensagem de alerta
Resource        ../resources/login_steps.robot
Test Template   Logando com credenciais invalídas devo ver uma mensagem de alerta

#Setup => coisas que devem acontecer antes do teste
#TearDown => coisas que devem acontecer depois  do teste

#DDT => Data Driven Testing (Teste Criado por Dados)

Test Setup      Abrir navegador 
Test Teardown   Fechar navegador



*** Test Cases ***


Senha inválida              papito@ninjaplus.com        asdfg       Usuário e/ou senha inválidos
Usuário nao cadastrado      padrekededo@nokexiste.com   asdfg       Usuário e/ou senha inválidos
