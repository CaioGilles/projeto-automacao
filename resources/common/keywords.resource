*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Abrir Navegador e Acessar a Página de Login
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${tmpdir}=    Evaluate    __import__('tempfile').mkdtemp()
    ${headless}=    Set Variable    --headless=new
    ${userdatadir}=    Set Variable    --user-data-dir=${tmpdir}
    Call Method    ${options}    add_argument    ${headless}
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    ${userdatadir}
    Create WebDriver    Chrome    options=${options}
    Go To    https://www.saucedemo.com/
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    


Fechar Navegador
    Close Browser



