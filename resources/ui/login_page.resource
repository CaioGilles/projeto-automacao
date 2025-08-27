*** Settings ***
Documentation    Recursos da página de login

*** Variables ***
${CAMPO_USUARIO}    id:user-name
${CAMPO_SENHA}    id:password
${BOTAO_LOGIN}    id:login-button


*** Keywords ***
Digitar Usuario
    [Arguments]    ${usuario}
    Input Text    ${CAMPO_USUARIO}    ${usuario}

Digitar Senha
    [Arguments]    ${senha}
    Input Text    ${CAMPO_SENHA}    ${senha}

Clicar em Login
    Click Element    ${BOTAO_LOGIN}