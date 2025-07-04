*** Settings ***
Documentation    Common keywords and utilities used across test suites
Library    Browser
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_PT
Resource    ../variables/env_variables.resource

*** Keywords ***
Abrir o Navegador e Acessar a Aplicação
    [Documentation]    Opens browser and navigates to the application URL
    [Tags]             setup    browser
    New Browser    headless=false
    New Context
    New Page    ${BASE_URL}

Gerar Email Não Cadastrado
    [Documentation]    Generates a random email address for testing
    [Tags]             data_generation
    ${email}=    FakerLibrary.Email
    RETURN    ${email}

Gerar Nome Aleatório
    [Documentation]    Generates a random name for testing
    [Tags]             data_generation
    ${name}=    FakerLibrary.Name
    RETURN    ${name}

Preencher Formulário de Cadastro
    [Documentation]    Fills registration form with provided or generated data
    [Arguments]        ${name}=${EMPTY}    ${email}=${EMPTY}    ${password}=${EMPTY}
    [Tags]             form_handling
    IF    '${name}' == ''
        ${name}=    Gerar nome aleatório
    END
    IF    '${email}' == ''
        ${email}=    Gerar email não cadastrado
    END
    IF    '${password}' == ''
        ${password}=    Set Variable    Test1234!
    END
    Fill Text    id=name    ${name}
    Fill Text    id=email    ${email}
    Fill Text    id=password    ${password}
    Fill Text    id=confirmPassword    ${password}
    Click    xpath=//button[text()='Cadastrar']
    Set Suite Variable    ${CADASTRO_EMAIL}    ${email}
    Set Suite Variable    ${CADASTRO_PASSWORD}    ${password}
    RETURN    ${email}    ${password}

Verificar Login
    [Documentation]    Verifies if user is logged in or not based on profile link visibility
    [Arguments]        ${deve_logar}=True
    [Tags]             verification
    ${estado_esperado}=    Run Keyword If    '${deve_logar}'=='True'    Set Variable    visible    ELSE    Set Variable    hidden
    Wait For Elements State    xpath=//a[@href='/profile']    ${estado_esperado}    timeout=5s
