*** Settings ***
Documentation   O usuário informa suas credenciais de acesso e submete o formulário de login
Resource        ../resources/login_steps.robot

#Setup => coisas que devem acontecer antes do teste
#TearDown => coisas que devem acontecer depois  do teste

#DDT => Data Driven Testing (Teste Criado por Dados)

Test Setup      Abrir navegador 
Test Teardown   Fechar navegador



*** Test Cases ***
Login com sucesso
    Fazendo login com "papito@ninjaplus.com" e com senha "pwd123"
    Devo ver meu nome "Papito" na área logada

Senha inválida
    Fazendo login com "padrekededo@nokexiste.com" e com senha "asdfg"
    Devo ver a seguinte mensagem de alerta "Usuário e/ou senha inválidos"

Email deve ser requerido
    Fazendo login com "" e com senha "pwd123"
    Devo ver a seguinte mensagem de alerta "Opps. Cadê o email?"

Senha deve ser requerido
    Fazendo login com "papito@ninjaplus.com" e com senha ""
    Devo ver a seguinte mensagem de alerta "Opps. Cadê a senha?"
