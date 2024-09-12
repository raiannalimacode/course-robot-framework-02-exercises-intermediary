*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                            https://www.google.com
${search_term}                    receita de lasanha    
${second_item}                    //h3[contains(text(), "lasanha de carne")]
${input_search}                   //textarea[@aria-label="Pesquisar"] 

*** Keywords ***
Abrir o navegador na página do Google
    Open Browser           ${url}                chrome
Pesquisar no Google
    Input Text    ${input_search}          ${search_term}
    Press Keys    ${input_search}          ENTER

Clicar na segunda receita
    Wait Until Page Contains Element    ${second_item}    10s
    Click Element    ${second_item}
    Close Browser

*** Test Cases ***
Entrar no site do Google e pesquisar uma receita
    Abrir o navegador na página do Google
    Pesquisar no Google
    Clicar na segunda receita