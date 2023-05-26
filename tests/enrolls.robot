*** Settings ***
Documentation        Suite de testes de matrícula de alunas
...                  Administrador duma vez logado consegue matricular alunos na academia

Resource             ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    # Falcão Não Mexer
    # Smart
    # Data de início 25/05/2023

    ${admin}    Create Dictionary
    ...         name=Admin
    ...         email=admin@smartbit.com 
    ...         pass=qacademy

    Do Login    ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student        Falcão Não Mexer
    Select Plan           Smart
    Fill Start Date                    
    Sleep    5  