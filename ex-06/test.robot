*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                             https://www.youtube.com/
${input_search}                    //input[@id="search"]
${btn_search}                      //button[@id="search-icon-legacy"]  
${first_item}                      (//ytd-video-renderer//a[@id='video-title'])[1]
${video_title}                     //h1[@class='title style-scope ytd-video-primary-info-renderer']

*** Keywords ***
Abrir o navegador no site do Youtube 
    Open Browser        ${url}            chrome

Pesquisar algo no Youtube 
    Input Text            ${input_search}            Chase Atlantic
    Click Button          ${btn_search}

Clicar no primeiro vídeo
    Wait Until Element Is Visible                ${first_item}        20s
    Click Element                                ${first_item}

Verificar se o primeiro vídeo está na tela
    Wait Until Element Is Visible            ${video_title}           20s 
    Element Should Be Visible                ${video_title}

Fechar navegador
    Close Browser

*** Test Cases ***
Abrir o Youtube, pesquisar por um vídeo e clicar no primeiro
    Abrir o navegador no site do Youtube
    Pesquisar algo no Youtube
    Clicar no primeiro vídeo
    Verificar se o primeiro vídeo está na tela
    Fechar navegador