*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${url}                            https://opensource-demo.orangehrmlive.com/
${input_name}                     //input[@name="username"]
${input_password}                 //input[@name="password"]
${key_name}                       Admin
${key_password}                   admin123 
${btn_login}                      //button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"]  
${btn_PIN}                        (//li[@class="oxd-main-menu-item-wrapper"])[2]
${btn_add_new_PIN}                //button[@class="oxd-button oxd-button--medium oxd-button--secondary"]
${input_file}                     xpath=//input[@class="oxd-file-input"]        
#//input[@class="oxd-file-input"]
${input_employee_first_name}      //input[@name="firstName"]  
${input_employee_middle_name}     //input[@name="middleName"]
${input_employee_last_name}       //input[@name="lastName"]
${input_employee_id}              (//input[@class="oxd-input oxd-input--active"])[2]  
${key_employee_first_name}         Red 
${key_employee_middle_name}        Bull
${key_employee_last_name}          Light
${key_employee_id}                 887766
${key_image}                       https://drive.google.com/uc?export=view&id=1PTrJ9qPn4JKni5kV-l6e1WgfO2A8ZczQ          
${btn_save}                       //button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]
${title_employee}                 //div[@class="orangehrm-edit-employee-name"]

*** Keywords ***
Abrir o navegador no site OrangeHrm 
    Open Browser        ${url}            chrome

Fazer login
    Wait Until Element Is Visible         ${input_name}                 20s
    Input Text                            ${input_name}                 ${key_name}
    Input Text                            ${input_password}             ${key_password} 
    Click Element                         ${btn_login}

Cadastrar um novo funcionário
    Wait Until Element Is Visible         ${btn_PIN}                      20s
    Click Element                         ${btn_PIN}
    Wait Until Element Is Visible         ${btn_add_new_PIN}              20s
    Click Element                         ${btn_add_new_PIN}
    Wait Until Element Is Visible         ${input_file}                   30s 
    Sleep                                 20s            
    Execute Javascript    const elem = document.evaluate('//input[@class="oxd-file-input"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; if (elem) { elem.style.opacity='1'; elem.style.visibility='visible'; elem.style.display='block'; } else { console.log('Elemento não encontrado'); }
    Sleep                                 30s    
    Choose File                           ${input_file}                   ${key_image}   
    Wait Until Element Is Visible         ${input_employee_first_name}    20s  
    Input Text                            ${input_employee_first_name}    ${key_employee_first_name} 
    Wait Until Element Is Visible         ${input_employee_middle_name}   20s
    Input Text                            ${input_employee_middle_name}   ${key_employee_middle_name}
    Wait Until Element Is Visible         ${input_employee_last_name}     20s
    Input Text                            ${input_employee_last_name}     ${key_employee_last_name}   
    Wait Until Element Is Visible         ${input_employee_id}            20s
    Input Text                            ${input_employee_id}            ${key_employee_id}    
    Click Element                         ${btn_save}

Verificar se o funcionário foi salvo
    Element Should Be Visible             ${title_employee}   

Fechar o navegador
    Close Browser

*** Test Cases ***
Abrir o site da OrangeHrm, fazer login e cadastrar um novo funcionário
    Abrir o navegador no site OrangeHrm
    Fazer login
    Cadastrar um novo funcionário
    Verificar se o funcionário foi salvo
    Fechar o navegador
    
#Código não funcionou, pois não foi possível detectar o input de imagem. 