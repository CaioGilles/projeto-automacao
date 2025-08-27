*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HEADLESS}    ${TRUE}
${BROWSER_DELAY}    5s
${POST_LOGIN_DELAY}    8s

*** Keywords ***
Abrir Navegador e Acessar a Página de Login
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${timestamp}=    Evaluate    str(__import__('time').time()).replace('.', '_')
    ${tmpdir}=    Evaluate    __import__('tempfile').mkdtemp(prefix=f'chrome_{timestamp}_', suffix='_profile')
    ${headless}=    Set Variable    --headless=new
    ${userdatadir}=    Set Variable    --user-data-dir=${tmpdir}
    Run Keyword If    '${HEADLESS}'=='${TRUE}'    Call Method    ${options}    add_argument    ${headless}
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --disable-plugins
    Call Method    ${options}    add_argument    --disable-background-timer-throttling
    Call Method    ${options}    add_argument    --disable-backgrounding-occluded-windows
    Call Method    ${options}    add_argument    --disable-renderer-backgrounding
    Call Method    ${options}    add_argument    ${userdatadir}
    Create WebDriver    Chrome    options=${options}
    Go To    https://www.saucedemo.com/
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Sleep    ${BROWSER_DELAY}

Pausar Após Login
    Sleep    ${POST_LOGIN_DELAY}

Fechar Navegador
    Close Browser



