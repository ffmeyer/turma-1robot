*** Settings ***
Documentation   O usuário informa suas credenciais de acesso e submete o formulário de login
Resource        ../resources/login_steps.robot

*** Test Cases ***
Login com sucesso
    Fazendo login com "papito@ninjaplus.com" e com senha "pwd123"
    Devo ver meu nome "Papito" na área logada