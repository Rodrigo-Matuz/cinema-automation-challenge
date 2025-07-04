*** Settings ***
Documentation    Keywords for user registration functionality
...              Handles navigation to registration page and form interactions
Library          Browser
Resource         ../variables/env_variables.resource

*** Keywords ***
Acessar Tela De Cadastrado
    [Documentation]    Navigates to the user registration page
    [Tags]             navigation    registration
    Wait For Elements State    xpath=//nav//a[text()='Cadastrar']    visible
    Click    xpath=//nav//a[text()='Cadastrar']
    Sleep    2s
