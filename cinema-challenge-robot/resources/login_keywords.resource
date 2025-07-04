*** Settings ***
Library    Browser
Resource    ../variables/env_variables.resource
Resource    ../resources/common_keywords.resource

*** Keywords ***
Acessar Tela de Login
    [Documentation]    Navigates to the login page
    [Tags]             navigation    authentication
    Wait For Elements State    xpath=//nav//a[text()='Login']    visible
    Click    xpath=//nav//a[text()='Login']

Preencher Campos Para Login
    [Documentation]    Fills login form with stored credentials
    [Tags]             form_handling    authentication
    Fill Text    id=email    ${CADASTRO_EMAIL}
    Fill Text    id=password    ${CADASTRO_PASSWORD}
    Click    xpath=//button[text()='Entrar']

Realizar login
    [Documentation]    Performs complete login flow with stored credentials
    [Tags]             authentication    workflow
    Abrir o Navegador e Acessar a Aplicação
    Acessar Tela de Login
    Preencher Campos Para Login

Abrir Perfil
    [Documentation]    Navigates to user profile page
    [Tags]             navigation    profile
    Wait For Elements State    xpath=//a[normalize-space(text())="Perfil"]    visible
    Click    xpath=//a[normalize-space(text())="Perfil"]
    Wait For Elements State    xpath=//h1[normalize-space(text())="Meu Perfil"]    visible
