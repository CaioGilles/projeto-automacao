*** Settings ***
Documentation    Recursos da página de inventário
Library    SeleniumLibrary

*** Variables ***
${BOTAO_ADICIONAR_AO_CARRINHO}    css:button[data-test="add-to-cart-sauce-labs-backpack"]
${ICONE_CARRINHO}    css:.shopping_cart_link    
${BADGE_CARRINHO}    css:.shopping_cart_badge

*** Keywords ***
A página de inventário deve estar visível
    Wait Until Page Contains    Products

Adicionar Primeiro Produto ao Carrinho
    Wait Until Element Is Visible    ${BOTAO_ADICIONAR_AO_CARRINHO}    20s
    Scroll Element Into View    ${BOTAO_ADICIONAR_AO_CARRINHO}
    Sleep    2s
    Click Element    ${BOTAO_ADICIONAR_AO_CARRINHO}
    Sleep    1s
    Wait Until Page Contains Element    xpath://button[normalize-space()="Remove"]    20s

Verificar Se o Produto Foi Adicionado ao Carrinho
    [Arguments]    ${quantidade}
    Wait Until Page Contains Element    ${BADGE_CARRINHO}    20s
    Wait Until Keyword Succeeds    10x    1s    Element Text Should Be    ${BADGE_CARRINHO}    ${quantidade}
    