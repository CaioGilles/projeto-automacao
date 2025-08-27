*** Settings ***
Documentation    Recursos da página de inventário
Library    SeleniumLibrary

*** Variables ***
${BOTAO_ADICIONAR_AO_CARRINHO}    xpath://button[contains(text(),'Add to cart')]
${ICONE_CARRINHO}    css:.shopping_cart_link    
${BADGE_CARRINHO}    css:.shopping_cart_badge

*** Keywords ***
A página de inventário deve estar visível
    Wait Until Page Contains    Products

Adicionar Primeiro Produto ao Carrinho
    Wait Until Element Is Visible    ${BOTAO_ADICIONAR_AO_CARRINHO}    10s
    Click Element    ${BOTAO_ADICIONAR_AO_CARRINHO}

Verificar Se o Produto Foi Adicionado ao Carrinho
    [Arguments]    ${quantidade}
    Wait Until Page Contains Element    ${BADGE_CARRINHO}    10s
    Wait Until Keyword Succeeds    5x    1s    Element Text Should Be    ${BADGE_CARRINHO}    ${quantidade}
    