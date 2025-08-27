*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Abrir Navegador e Acessar a Página de Login
    Open Browser    https://www.saucedemo.com/    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    


Fechar Navegador
    Close Browser



