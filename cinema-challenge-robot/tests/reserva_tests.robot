*** Settings ***
Resource    ../resources/login_keywords.resource
Resource    ../resources/reserva_keywords.resource
Library     Browser
Suite Setup    Realizar login

*** Keywords ***
Implementando
    Log    Implementando funcionalidade...

*** Test Cases ***
Pesquisar por filme
    [Documentation]    Verifies movie search functionality returns correct results
    [Tags]             search    positive    smoke
    Acessar Filmes em cartaz
    ${titulo_encontrado}=    Capturar Titulo Primeiro Card
    Preencher Campo De Busca    ${titulo_encontrado}
    ${titulo_filtrado}=    Capturar Titulo Primeiro Card
    Validar Titulo Esperado    ${titulo_filtrado}    ${titulo_encontrado}

Verificar carregamento da lista de filmes
    [Documentation]    Verifies movie list loads correctly with all required information
    [Tags]             listing    positive    smoke
    Implementando

Selecionar filme e navegar para horários
    [Documentation]    Verifies navigation from movie list to showtime selection
    [Tags]             navigation    positive    smoke
    Implementando

Verificar exibição de horários disponíveis
    [Documentation]    Verifies showtime information is displayed correctly
    [Tags]             showtime    positive    functional
    Implementando

Selecionar horário e navegar para seleção de assentos
    [Documentation]    Verifies navigation from showtime to seat selection
    [Tags]             navigation    positive    functional
    Implementando

Verificar exibição do mapa de assentos
    [Documentation]    Verifies seat map displays correctly with available/occupied seats
    [Tags]             seats    positive    functional
    Implementando

Selecionar e desselecionar assentos
    [Documentation]    Verifies seat selection and deselection functionality
    [Tags]             seats    positive    functional
    Implementando

Tentar selecionar assento ocupado
    [Documentation]    Verifies occupied seats cannot be selected
    [Tags]             seats    negative    validation
    Implementando

Selecionar múltiplos assentos
    [Documentation]    Verifies multiple seat selection functionality
    [Tags]             seats    positive    functional
    Implementando

Tentar selecionar mais assentos que o limite
    [Documentation]    Verifies seat selection limit validation
    [Tags]             seats    negative    validation
    Implementando

Prosseguir para checkout com assentos selecionados
    [Documentation]    Verifies navigation from seat selection to checkout
    [Tags]             checkout    positive    functional
    Implementando

Verificar campos do formulário de checkout
    [Documentation]    Verifies checkout form displays all required fields
    [Tags]             checkout    positive    functional
    Implementando

Verificar cálculo do preço total
    [Documentation]    Verifies price calculation based on selected seats
    [Tags]             checkout    positive    functional
    Implementando

Preencher checkout com dados válidos
    [Documentation]    Verifies successful checkout with valid information
    [Tags]             checkout    positive    functional
    Implementando

Tentar checkout com email inválido
    [Documentation]    Verifies email validation in checkout form
    [Tags]             checkout    negative    validation
    Implementando

Tentar checkout com campos vazios
    [Documentation]    Verifies required field validation in checkout
    [Tags]             checkout    negative    validation
    Implementando