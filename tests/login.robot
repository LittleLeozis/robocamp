*** Settings ***
Documentation        Suite de testes de autenticação
...                  Administrador deve acessar o portal de gestão de academias

Resource             ../resources/base.resource

*** Test Cases ***
Login do Administrador
    Go To Login Page
    Fill Credencials    admin@smartbit.com    qacademy
    Submit Credencials
    Used Should Be Logged In    Admin

Email nao cadastrado    
    Go To Login Page
    Fill Credencials    404@smartbit.com    qacademy
    Submit Credencials
    Verify Toaster      Suas credenciais são inválidas, por favor tente novamente!

Senha Invalida
    Go To Login Page
    Fill Credencials    admin@smartbit.com    abc123
    Submit Credencials
    Verify Toaster      Suas credenciais são inválidas, por favor tente novamente!

Email no formato incorreto
    Go To Login Page
    Fill Credencials    @.com.br    abc123
    Submit Credencials
    Field Type Should Be Email

Senha em branco
    Go To Login Page
    Fill Credencials    admin@smartbit.com    ${EMPTY}
    Submit Credencials
    Alert Text Sould Be    password    A senha é obrigatória

Email em branco
    Go To Login Page
    Fill Credencials    ${EMPTY}    abc123
    Submit Credencials
    Alert Text Sould Be    email    O e-mail é obrigatório

Email e Senha em branco
    Go To Login Page
    Submit Credencials
    Alert Text Sould Be    email        O e-mail é obrigatório
    Alert Text Sould Be    password     A senha é obrigatória


