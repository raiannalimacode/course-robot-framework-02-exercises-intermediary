*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                             https://www.pelando.com.br/?view_mode=grid
${second_offer}                    (//li[contains(@class, 'sc-cb8be5d8-2 gCNDtB')])[2]
${btn_see_promotion}               (//button[contains(@class, 'sc-lnsjTu fUkuof sc-KrNfM cfZbga')])[2] 

*** Keywords ***
Abrir o navegador no site da loja Pelando
    Open Browser        ${url}            chrome

Clicar no botão da segunda promoção 
    Wait Until Element Is Visible        ${btn_see_promotion}
    Wait Until Element Is Enabled        ${btn_see_promotion}
    Click Element                        ${btn_see_promotion}

Fechar o navegador
    Close Browser

*** Test Cases ***
Abrir o site da loja Pelando e clicar na segunda promoção
    Abrir o navegador no site da loja Pelando
    Clicar no botão da segunda promoção
    Fechar o navegador