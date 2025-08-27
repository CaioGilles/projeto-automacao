*** Settings ***
Documentation    Testes da página de login
Resource    ../../resources/common/keywords.resource
Resource    ../../resources/ui/login_page.resource
Test Setup    Abrir Navegador e Acessar a Página de Login
Test Teardown    Fechar Navegador


*** Test Cases ***
Cenário: Login com Credenciais Válidas
    [Tags]    smoke    login
    Digitar Usuario    standard_user
    Digitar Senha    secret_sauce
    Clicar em Login
    Location Should Be    https://www.saucedemo.com/inventory.html
    







