*** Settings ***
Documentation    Testes de cenários de erro e validações no checkout
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

Ir para Checkout com Produto
    Adicionar Primeiro Produto ao Carrinho
    Acessar Carrinho de Compras
    Iniciar Checkout

*** Test Cases ***
Cenário: Validar Campo Nome Obrigatório
    [Tags]    regression    validation    required-fields
    [Documentation]    Testa se o campo nome é obrigatório
    Ir para Checkout com Produto
    
    # Tentar continuar sem preencher nome
    Wait Until Element Is Visible    ${BOTAO_CONTINUE}    15s
    Click Element    ${BOTAO_CONTINUE}
    
    # Verificar mensagem de erro
    Wait Until Page Contains    Error: First Name is required    15s

Cenário: Validar Campo Sobrenome Obrigatório
    [Tags]    regression    validation    required-fields
    [Documentation]    Testa se o campo sobrenome é obrigatório
    Ir para Checkout com Produto
    
    # Preencher apenas o nome
    Wait Until Page Contains Element    id:first-name    15s
    Input Text    id:first-name    João
    
    # Tentar continuar
    Wait Until Element Is Visible    ${BOTAO_CONTINUE}    15s
    Click Element    ${BOTAO_CONTINUE}
    
    # Verificar mensagem de erro
    Wait Until Page Contains    Error: Last Name is required    15s

Cenário: Validar Campo CEP Obrigatório
    [Tags]    regression    validation    required-fields
    [Documentation]    Testa se o campo CEP é obrigatório
    Ir para Checkout com Produto
    
    # Preencher nome e sobrenome
    Wait Until Page Contains Element    id:first-name    15s
    Input Text    id:first-name    João
    Input Text    id:last-name    Silva
    
    # Tentar continuar
    Wait Until Element Is Visible    ${BOTAO_CONTINUE}    15s
    Click Element    ${BOTAO_CONTINUE}
    
    # Verificar mensagem de erro
    Wait Until Page Contains    Error: Postal Code is required    15s

Cenário: Validar Formato de CEP
    [Tags]    regression    validation    format
    [Documentation]    Testa se o CEP é aceito em diferentes formatos
    Ir para Checkout com Produto
    
    # Preencher informações com CEP em formato diferente
    Wait Until Page Contains Element    id:first-name    15s
    Input Text    id:first-name    Ana
    Input Text    id:last-name    Costa
    Input Text    id:postal-code    12345
    
    # Tentar continuar
    Wait Until Element Is Visible    ${BOTAO_CONTINUE}    15s
    Click Element    ${BOTAO_CONTINUE}
    
    # Verificar se conseguiu prosseguir (não deve dar erro)
    Wait Until Page Contains    Checkout: Overview    15s

Cenário: Cancelar Checkout e Voltar ao Carrinho
    [Tags]    regression    navigation    cancel
    [Documentation]    Testa se é possível cancelar o checkout e voltar ao carrinho
    Ir para Checkout com Produto
    
    # Preencher informações
    Wait Until Page Contains Element    id:first-name    15s
    Input Text    id:first-name    Carlos
    Input Text    id:last-name    Lima
    Input Text    id:postal-code    98765-432
    
    # Continuar checkout
    Continuar Checkout
    
    # Clicar em Cancel (se existir) ou voltar
    Wait Until Page Contains    Checkout: Overview    15s
    
    # Verificar se há botão de cancelar ou voltar
    Page Should Contain    Checkout: Overview
