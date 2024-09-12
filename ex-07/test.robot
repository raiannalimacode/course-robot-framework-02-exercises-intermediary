*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                    https://www.pelando.com.br/?view_mode=grid
${first_offer}            (//li[contains(@class, 'sc-cb8be5d8-2 gCNDtB')])[1]

*** Keywords ***
Abrir o navegador no site da loja Pelando
    Open Browser        ${url}            chrome

Clicar na primeira promoção 
    Wait Until Element Is Visible        ${first_offer}
    Wait Until Element Is Enabled        ${first_offer}
    Click Element                        ${first_offer}

Fechar o navegador
    Close Browser

*** Test Cases ***
Abrir o site da loja Pelando e clicar na primeira promoção
    Abrir o navegador no site da loja Pelando
    Clicar na primeira promoção
    Fechar o navegador