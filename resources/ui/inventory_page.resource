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
    Wait Until Element Is Visible    ${BOTAO_ADICIONAR_AO_CARRINHO}    20s
    Click Element    ${BOTAO_ADICIONAR_AO_CARRINHO}
    Wait Until Page Contains Element    xpath://button[normalize-space()="Remove"]    10s

Verificar Se o Produto Foi Adicionado ao Carrinho
    [Arguments]    ${quantidade}
    Wait Until Page Contains Element    ${BADGE_CARRINHO}    20s
    Wait Until Keyword Succeeds    10x    1s    Element Text Should Be    ${BADGE_CARRINHO}    ${quantidade}
    