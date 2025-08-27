*** Settings ***
Documentation    Recursos da página de inventário
Library    SeleniumLibrary

*** Variables ***
${BOTAO_ADICIONAR_AO_CARRINHO}    css:button[data-test="add-to-cart-sauce-labs-backpack"]
${ICONE_CARRINHO}    css:.shopping_cart_link    
${BADGE_CARRINHO}    css:.shopping_cart_badge
${BOTAO_REMOVER_DO_CARRINHO}    css:button[data-test="remove-sauce-labs-backpack"]
${BOTAO_CHECKOUT}    css:button[data-test="checkout"]
${BOTAO_CONTINUE}    css:input[data-test="continue"]
${BOTAO_FINISH}    css:button[data-test="finish"]
${BOTAO_BACK_HOME}    css:button[data-test="back-to-products"]

*** Keywords ***
A página de inventário deve estar visível
    Wait Until Page Contains    Products    10s

Adicionar Primeiro Produto ao Carrinho
    # Aguardar a página carregar completamente
    Wait Until Page Contains    Products    15s
    Sleep    2s
    
    # Verificar se o botão está visível
    Wait Until Element Is Visible    ${BOTAO_ADICIONAR_AO_CARRINHO}    15s
    
    # Scroll para o elemento
    Scroll Element Into View    ${BOTAO_ADICIONAR_AO_CARRINHO}
    Sleep    1s
    
    # Clicar no botão
    Click Element    ${BOTAO_ADICIONAR_AO_CARRINHO}
    Sleep    3s
    
    # Verificar se o produto foi adicionado verificando o badge do carrinho
    Wait Until Page Contains Element    ${BADGE_CARRINHO}    15s

Verificar Se o Produto Foi Adicionado ao Carrinho
    [Arguments]    ${quantidade}
    # Primeiro verificar se o badge apareceu
    Wait Until Page Contains Element    ${BADGE_CARRINHO}    15s
    
    # Aguardar um pouco para garantir que o valor foi atualizado
    Sleep    2s
    
    # Verificar se o valor está correto
    Wait Until Keyword Succeeds    15x    2s    Element Text Should Be    ${BADGE_CARRINHO}    ${quantidade}

Acessar Carrinho de Compras
    Wait Until Element Is Visible    ${ICONE_CARRINHO}    15s
    Click Element    ${ICONE_CARRINHO}
    Wait Until Page Contains    Your Cart    15s

Verificar Produto no Carrinho
    [Arguments]    ${nome_produto}
    Wait Until Page Contains    ${nome_produto}    15s

Iniciar Checkout
    Wait Until Element Is Visible    ${BOTAO_CHECKOUT}    15s
    Click Element    ${BOTAO_CHECKOUT}
    Wait Until Page Contains    Checkout: Your Information    15s

Preencher Informações de Checkout
    [Arguments]    ${primeiro_nome}    ${ultimo_nome}    ${cep}
    Wait Until Page Contains Element    id:first-name    15s
    Input Text    id:first-name    ${primeiro_nome}
    Input Text    id:last-name    ${ultimo_nome}
    Input Text    id:postal-code    ${cep}

Continuar Checkout
    Wait Until Element Is Visible    ${BOTAO_CONTINUE}    15s
    Click Element    ${BOTAO_CONTINUE}
    Wait Until Page Contains    Checkout: Overview    15s

Verificar Resumo da Compra
    [Arguments]    ${nome_produto}
    Wait Until Page Contains    ${nome_produto}    15s
    Wait Until Page Contains    Payment Information    15s
    Wait Until Page Contains    Shipping Information    15s

Finalizar Compra
    Wait Until Element Is Visible    ${BOTAO_FINISH}    15s
    Click Element    ${BOTAO_FINISH}
    Wait Until Page Contains    Thank you for your order!    15s

Verificar Compra Finalizada
    Wait Until Page Contains    Your order has been dispatched    15s
    Wait Until Page Contains Element    ${BOTAO_BACK_HOME}    15s

Voltar para Inventário
    Wait Until Element Is Visible    ${BOTAO_BACK_HOME}    15s
    Click Element    ${BOTAO_BACK_HOME}
    Wait Until Page Contains    Products    15s 
    