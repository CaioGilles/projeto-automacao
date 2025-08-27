*** Settings ***
Documentation    Testes da funcionalidade de inventário de produtos
Resource    ../../resources/common/keywords.resource
Resource    ../../resources/ui/login_page.resource
Resource    ../../resources/ui/inventory_page.resource
Test Setup    Fazer Login Completo
Test Teardown    Fechar Navegador

*** Keywords ***
Fazer Login Completo
    Abrir Navegador e Acessar a Página de Login
    Digitar Usuario    standard_user
    Digitar Senha    secret_sauce
    Clicar em Login
    Location Should Be    https://www.saucedemo.com/inventory.html
    A página de inventário deve estar visível
    Pausar Após Login

*** Test Cases ***
Cenário: Adicionar Produto ao Carrinho
    [Tags]    regression    cart
    Adicionar Primeiro Produto ao Carrinho
    Verificar Se o Produto Foi Adicionado ao Carrinho    1

Cenário: Adicionar e Remover Produto do Carrinho
    [Tags]    regression    cart    remove
    
    # Adicionar produto
    Adicionar Primeiro Produto ao Carrinho
    Verificar Se o Produto Foi Adicionado ao Carrinho    1
    
    # Remover produto
    Wait Until Element Is Visible    ${BOTAO_REMOVER_DO_CARRINHO}    20s
    Click Element    ${BOTAO_REMOVER_DO_CARRINHO}
    Sleep    2s
    
    # Verificar que foi removido
    Page Should Not Contain Element    ${BADGE_CARRINHO}

Cenário: Verificar Funcionalidade do Carrinho
    [Tags]    regression    cart    navigation
    
    # Adicionar produto
    Adicionar Primeiro Produto ao Carrinho
    Verificar Se o Produto Foi Adicionado ao Carrinho    1
    
    # Acessar carrinho
    Acessar Carrinho de Compras
    Verificar Produto no Carrinho    Sauce Labs Backpack
    
    # Verificar botão de checkout
    Wait Until Element Is Visible    ${BOTAO_CHECKOUT}    20s
    Page Should Contain Element    ${BOTAO_CHECKOUT}
    





