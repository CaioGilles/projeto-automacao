*** Settings ***
Documentation    Testes do fluxo completo de checkout e compra
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
Cenário: Fluxo Completo de Compra - Produto Individual
    [Tags]    regression    checkout    complete-flow
    [Documentation]    Testa o fluxo completo desde login até finalização da compra
    
    # Passo 1: Adicionar produto ao carrinho
    Adicionar Primeiro Produto ao Carrinho
    Verificar Se o Produto Foi Adicionado ao Carrinho    1
    
    # Passo 2: Acessar carrinho
    Acessar Carrinho de Compras
    Verificar Produto no Carrinho    Sauce Labs Backpack
    
    # Passo 3: Iniciar checkout
    Iniciar Checkout
    
    # Passo 4: Preencher informações pessoais
    Preencher Informações de Checkout    João    Silva    12345-678
    
    # Passo 5: Continuar para resumo
    Continuar Checkout
    
    # Passo 6: Verificar resumo da compra
    Verificar Resumo da Compra    Sauce Labs Backpack
    
    # Passo 7: Finalizar compra
    Finalizar Compra
    
    # Passo 8: Verificar confirmação
    Verificar Compra Finalizada
    
    # Passo 9: Voltar para inventário
    Voltar para Inventário
    A página de inventário deve estar visível

Cenário: Verificar Fluxo de Checkout sem Produtos
    [Tags]    regression    checkout    empty-cart
    [Documentation]    Testa tentativa de checkout com carrinho vazio
    
    # Tentar acessar carrinho vazio
    Acessar Carrinho de Compras
    Wait Until Page Contains    Your Cart    15s
    
    # Verificar que não há botão de checkout visível
    Page Should Not Contain Element    ${BOTAO_CHECKOUT}

Cenário: Validação de Campos Obrigatórios no Checkout
    [Tags]    regression    checkout    validation
    [Documentation]    Testa validação de campos obrigatórios no checkout
    
    # Adicionar produto e ir para checkout
    Adicionar Primeiro Produto ao Carrinho
    Acessar Carrinho de Compras
    Iniciar Checkout
    
    # Tentar continuar sem preencher campos
    Wait Until Element Is Visible    ${BOTAO_CONTINUE}    15s
    Click Element    ${BOTAO_CONTINUE}
    
    # Verificar mensagem de erro
    Wait Until Page Contains    Error: First Name is required    15s
