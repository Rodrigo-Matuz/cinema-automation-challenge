*** Settings ***
Documentation    Test suite for user authentication and registration functionality
Resource    ../resources/common_keywords.resource
Resource    ../resources/login_keywords.resource
Resource    ../resources/cadastro_keywords.resource

*** Test Cases ***
Cadastrar usuário com sucesso
    [Documentation]    Verifies successful user registration with valid data
    [Tags]             registration    positive    smoke
    Abrir o Navegador e Acessar a Aplicação
    Acessar Tela de Cadastrado
    Preencher Formulário de Cadastro 
    Verificar Login

Cadastrar usuário com email duplicado
    [Documentation]    Verifies system prevents duplicate email registration
    [Tags]             registration    negative    validation
    Abrir o Navegador e Acessar a Aplicação
    Acessar Tela de Cadastrado
    Preencher Formulário de Cadastro     ${EMPTY}    ${CADASTRO_EMAIL}    ${CADASTRO_PASSWORD}
    Verificar Login     ${FALSE}

Fazer login com sucesso
    [Documentation]    Verifies successful login with valid credentials
    [Tags]             login    positive    smoke
    Realizar login
    Verificar Login

Cadastrar usuário com e-mail em formato inválido
    [Documentation]    Verifies email format validation during registration
    [Tags]             registration    negative    validation
    Abrir o Navegador e Acessar a Aplicação
    Acessar Tela de Cadastrado
    ${email_invalido}=    Set Variable    emailsemarroba.com
    Preencher Formulário de Cadastro     ${EMPTY}    ${email_invalido}    ${CADASTRO_PASSWORD}
    Verificar Login    ${FALSE}

Cadastrar Usuário Com Senha Inválida
    [Documentation]    Verifies password validation during registration
    [Tags]             registration    negative    validation
    Abrir o Navegador e Acessar a Aplicação
    Acessar Tela de Cadastrado
    ${senha_invalida}=    Set Variable    123
    Preencher Formulário de Cadastro     ${EMPTY}    ${CADASTRO_EMAIL}    ${senha_invalida}
    Verificar Login    ${FALSE}


Alterar Senha de Usuário Cadastrado
    [Documentation]    Password change functionality - pending implementation
    [Tags]             profile    pending
    # TODO: A documentação do Swagger indica que está pronta
    Log To Console    Função não implementada

Visualizar Perfil
    [Documentation]    Verifies user can access and view profile information
    [Tags]             profile    positive    smoke
    Abrir o Navegador e Acessar a Aplicação
    Acessar Tela De Cadastrado
    Preencher Formulário de Cadastro
    Abrir Perfil

Logout do usuário
    [Documentation]    Verifies user can successfully logout
    [Tags]             logout    positive    security
    Abrir o Navegador e Acessar a Aplicação
    Acessar Tela de Cadastrado
    Preencher Formulário de Cadastro 
    Verificar Login
    # Placeholder para xpath do botão de logout
    Click    xpath=//html/body/div/header/div/nav/ul/li[5]/button
    Wait For Elements State    xpath=//nav//a[text()='Login']    visible

