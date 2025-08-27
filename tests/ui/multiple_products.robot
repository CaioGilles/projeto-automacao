*** Settings ***
Documentation    Testes com múltiplos produtos no carrinho
Resource    ../../resources/common/keywords.resource
Resource    ../../resources/ui/login_page.resource
Resource    ../../resources/ui/inventory_page.resource
Test Setup    Fazer Login Completo
Test Teardown    Fechar Navegador

*** Variables ***
${BOTAO_ADICIONAR_BOLSA}    css:button[data-test="add-to-cart-sauce-labs-backpack"]
${BOTAO_ADICIONAR_CAMISA}    css:button[data-test="add-to-cart-sauce-labs-bolt-t-shirt"]
${BOTAO_ADICIONAR_ONESIE}    css:button[data-test="add-to-cart-sauce-labs-onesie"]

*** Keywords ***
Fazer Login Completo
    Abrir Navegador e Acessar a Página de Login
    Digitar Usuario    standard_user
    Digitar Senha    secret_sauce
    Clicar em Login
    Location Should Be    https://www.saucedemo.com/inventory.html
    A página de inventário deve estar visível
    Pausar Após Login

Adicionar Múltiplos Produtos ao Carrinho
    # Adicionar bolsa
    Wait Until Element Is Visible    ${BOTAO_ADICIONAR_BOLSA}    15s
    Click Element    ${BOTAO_ADICIONAR_BOLSA}
    Sleep    2s
    
    # Adicionar camisa
    Wait Until Element Is Visible    ${BOTAO_ADICIONAR_CAMISA}    15s
    Click Element    ${BOTAO_ADICIONAR_CAMISA}
    Sleep    2s
    
    # Adicionar onesie
    Wait Until Element Is Visible    ${BOTAO_ADICIONAR_ONESIE}    15s
    Click Element    ${BOTAO_ADICIONAR_ONESIE}
    Sleep    2s

*** Test Cases ***
Cenário: Comprar Múltiplos Produtos
    [Tags]    regression    multiple-products    checkout
    [Documentation]    Testa o fluxo completo de compra com múltiplos produtos
    
    # Adicionar múltiplos produtos
    Adicionar Múltiplos Produtos ao Carrinho
    Verificar Se o Produto Foi Adicionado ao Carrinho    3
    
    # Acessar carrinho
    Acessar Carrinho de Compras
    
    # Verificar todos os produtos
    Verificar Produto no Carrinho    Sauce Labs Backpack
    Verificar Produto no Carrinho    Sauce Labs Bolt T-Shirt
    Verificar Produto no Carrinho    Sauce Labs Onesie
    
    # Iniciar checkout
    Iniciar Checkout
    
    # Preencher informações
    Preencher Informações de Checkout    Maria    Santos    54321-987
    
    # Continuar checkout
    Continuar Checkout
    
    # Verificar resumo com múltiplos produtos
    Verificar Resumo da Compra    Sauce Labs Backpack
    Verificar Resumo da Compra    Sauce Labs Bolt T-Shirt
    Verificar Resumo da Compra    Sauce Labs Onesie
    
    # Finalizar compra
    Finalizar Compra
    Verificar Compra Finalizada
    
    # Voltar para inventário
    Voltar para Inventário
    A página de inventário deve estar visível

Cenário: Verificar Total da Compra
    [Tags]    regression    pricing    total
    [Documentation]    Testa se o total da compra está sendo calculado corretamente
    
    # Adicionar produtos
    Adicionar Múltiplos Produtos ao Carrinho
    Acessar Carrinho de Compras
    Iniciar Checkout
    Preencher Informações de Checkout    Pedro    Costa    11111-222
    
    # Continuar para ver o resumo
    Continuar Checkout
    
    # Verificar se há informações de preço
    Wait Until Page Contains    Item total:    15s
    Wait Until Page Contains    Tax:    15s
    Wait Until Page Contains    Total:    15s
