*** Settings ***
Documentation    Keywords for movie reservation and cinema functionality
...              Handles movie browsing, seat selection and booking process
Resource    ../resources/login_keywords.resource
Resource    ../resources/reserva_keywords.resource
Library    Browser

*** Keywords ***
Capturar Titulo Primeiro Card
    [Documentation]    Captures the title of the first movie card displayed
    [Tags]             movie_data    extraction
    Wait For Elements State    xpath=(//div[contains(@class,'movie-card')]//h3[@class='movie-title'])[1]    visible
    ${titulo}=    Browser.Get Text    xpath=(//div[contains(@class,'movie-card')]//h3[@class='movie-title'])[1]
    RETURN    ${titulo}


Preencher Campo De Busca
    [Documentation]    Fills the movie search field with specified text
    [Arguments]        ${texto}
    [Tags]             search    input
    Fill Text    xpath=//input[@placeholder='Buscar filmes...']    ${texto}
    # Aguardar resultados da busca
    Sleep    1s

Validar Titulo Esperado
    [Documentation]    Validates that found title matches expected title
    [Arguments]        ${titulo_encontrado}    ${titulo_esperado}
    [Tags]             validation
    Should Be Equal    ${titulo_encontrado}    ${titulo_esperado}

Acessar Filmes em cartaz
    [Documentation]    Navigates to the movies in theaters page
    [Tags]             navigation
    ${text}    Set Variable    Filmes em Cartaz
    Click    xpath=//nav//a[normalize-space(text())='${text}']
    ${titulo}    Browser.Get Text    xpath=//h1[normalize-space(text())='${text}']
    Should Be Equal    ${titulo}    ${text}
