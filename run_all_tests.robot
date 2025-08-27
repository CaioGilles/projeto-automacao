*** Settings ***
Documentation    Executa todos os testes do fluxo de compra
Resource    resources/common/keywords.resource
Resource    resources/ui/login_page.resource
Resource    resources/ui/inventory_page.resource

*** Test Cases ***
Executar Todos os Testes de Compra
    [Documentation]    Executa todos os cenários de teste relacionados ao fluxo de compra
    [Tags]    complete-flow    all-tests
    
    # Teste de login
    Abrir Navegador e Acessar a Página de Login
    Digitar Usuario    standard_user
    Digitar Senha    secret_sauce
    Clicar em Login
    Location Should Be    https://www.saucedemo.com/inventory.html
    A página de inventário deve estar visível
    
    # Teste de adição ao carrinho
    Adicionar Primeiro Produto ao Carrinho
    Verificar Se o Produto Foi Adicionado ao Carrinho    1
    
    # Teste de acesso ao carrinho
    Acessar Carrinho de Compras
    Verificar Produto no Carrinho    Sauce Labs Backpack
    
    # Teste de checkout
    Iniciar Checkout
    Preencher Informações de Checkout    Usuario    Teste    12345-678
    Continuar Checkout
    Verificar Resumo da Compra    Sauce Labs Backpack
    
    # Teste de finalização
    Finalizar Compra
    Verificar Compra Finalizada
    
    # Teste de retorno
    Voltar para Inventário
    A página de inventário deve estar visível
    
    # Fechar navegador
    Fechar Navegador
