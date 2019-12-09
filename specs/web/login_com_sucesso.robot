*** Settings ***
Documentation   O usuário informa suas credenciais de acesso e vai para a area logada
Resource        ../../resources/web/steps/login.robot


#Setup => coisas que devem acontecer antes do teste
#TearDown => coisas que devem acontecer depois  do teste

#DDT => Data Driven Testing (Teste Criado por Dados)

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***
Login com sucesso
    Fazendo login com "papito@ninjaplus.com" e com senha "pwd123"
    Devo ver meu nome "Papito" na área logada 