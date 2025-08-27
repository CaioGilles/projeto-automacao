*** Settings ***
Documentation    Testes da funcionalidade de inventário de produtos
Resource    ../../resources/common/keywords.resource
Resource    ../../resources/ui/login_page.resource
Resource    ../../resources/ui/inventory_page.resource
Suite Setup    Abrir Navegador e Acessar a Página de Login
Suite Teardown    Fechar Navegador

*** Keywords ***
Dado que o usuário está logado
    Digitar Usuario    standard_user
    Digitar Senha    secret_sauce
    Clicar em Login
    Location Should Be    https://www.saucedemo.com/inventory.html
    A página de inventário deve estar visível
    Pausar Após Login

    
*** Test Cases ***
Cenário: Adicionar Produto ao Carrinho
    [Tags]    regression    cart
    Dado que o usuário está logado
    Adicionar Primeiro Produto ao Carrinho
    Verificar Se o Produto Foi Adicionado ao Carrinho    1
    





