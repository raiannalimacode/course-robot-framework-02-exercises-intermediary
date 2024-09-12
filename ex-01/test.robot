*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                            https://www.google.com
${search_term}                    receita de lasanha    
${first_item}                     //h3[contains(text(), "Lasanha à bolonhesa: como fazer o prato com carne moída")]
${input_search}                   //textarea[@aria-label="Pesquisar"] 

*** Keywords ***
Abrir o navegador na página do Google
    Open Browser           ${url}                chrome

Pesquisar no Google
    Input Text    ${input_search}          ${search_term}
    Press Keys    ${input_search}          ENTER

Clicar na primeira receita
    Wait Until Page Contains Element       ${first_item}    10s
    Click Element    ${first_item}

Fechar navegador
    Close Browser

*** Test Cases ***
Entrar no site do Google e pesquisar uma receita
    Abrir o navegador na página do Google
    Pesquisar no Google
    Clicar na primeira receita
    Fechar navegador