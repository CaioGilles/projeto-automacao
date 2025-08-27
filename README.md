# Projeto de Automação - Fluxo Completo de Compra

Este projeto implementa testes automatizados para o fluxo completo de compra em uma aplicação web de e-commerce (Sauce Demo).

## Funcionalidades Testadas

### ✅ Fluxo Completo de Compra
- **Login** - Autenticação do usuário
- **Navegação** - Acesso ao inventário de produtos
- **Carrinho** - Adição e remoção de produtos
- **Checkout** - Preenchimento de informações pessoais
- **Resumo** - Verificação dos produtos e valores
- **Finalização** - Confirmação da compra
- **Retorno** - Volta ao inventário após compra

### 📁 Estrutura dos Testes

#### Testes de Login
- `tests/ui/login.robot` - Testes de autenticação

#### Testes de Inventário
- `tests/ui/inventory.robot` - Testes de produtos e carrinho básico

#### Testes de Checkout
- `tests/ui/checkout.robot` - **NOVO**: Fluxo completo de compra
- `tests/ui/multiple_products.robot` - **NOVO**: Compra com múltiplos produtos
- `tests/ui/error_scenarios.robot` - **NOVO**: Validações e cenários de erro

#### Teste Completo
- `run_all_tests.robot` - **NOVO**: Executa todo o fluxo em sequência

## Como Executar

### Pré-requisitos
- Python 3.7+
- Robot Framework
- Selenium WebDriver
- Chrome Browser

### Instalação
```bash
# Ativar ambiente virtual
venv\Scripts\activate

# Instalar dependências
pip install -r requirements.txt
```

### Executar Testes Específicos

#### Teste de Login
```bash
robot tests/ui/login.robot
```

#### Teste de Inventário
```bash
robot tests/ui/inventory.robot
```

#### Teste de Checkout Completo
```bash
robot tests/ui/checkout.robot
```

#### Teste com Múltiplos Produtos
```bash
robot tests/ui/multiple_products.robot
```

#### Teste de Validações
```bash
robot tests/ui/error_scenarios.robot
```

#### Executar Todo o Fluxo
```bash
robot run_all_tests.robot
```

### Executar Todos os Testes
```bash
robot tests/ui/
```

## Cenários de Teste Implementados

### 🔐 Autenticação
- Login com credenciais válidas

### 🛒 Carrinho de Compras
- Adicionar produto ao carrinho
- Adicionar e remover produtos
- Verificar quantidade no carrinho
- Navegação para o carrinho

### 💳 Checkout
- Preenchimento de informações pessoais
- Validação de campos obrigatórios
- Resumo da compra
- Finalização da compra
- Confirmação de sucesso

### 📦 Múltiplos Produtos
- Compra com vários produtos
- Verificação de totais
- Resumo com múltiplos itens

### ⚠️ Validações
- Campos obrigatórios
- Formatos de dados
- Mensagens de erro
- Cenários de falha

## Estrutura de Recursos

### `resources/common/keywords.resource`
- Configuração do navegador
- Funções comuns de setup/teardown

### `resources/ui/login_page.resource`
- Elementos e ações da página de login

### `resources/ui/inventory_page.resource`
- **EXPANDIDO**: Todas as funcionalidades de inventário e checkout

## Tags Disponíveis

- `smoke` - Testes básicos
- `regression` - Testes de regressão
- `login` - Testes de autenticação
- `cart` - Testes de carrinho
- `checkout` - Testes de checkout
- `complete-flow` - Fluxo completo
- `multiple-products` - Múltiplos produtos
- `validation` - Validações
- `error` - Cenários de erro

## Relatórios

Após a execução, os relatórios são gerados em:
- `results/report.html` - Relatório detalhado
- `results/log.html` - Log de execução
- `results/output.xml` - Dados em XML

## Exemplo de Execução Completa

```bash
# Executar todo o fluxo de compra
robot run_all_tests.robot

# Executar testes específicos por tag
robot --include complete-flow tests/ui/
robot --include validation tests/ui/
robot --exclude error tests/ui/
```

## Status dos Testes

- ✅ **Login** - Implementado e testado
- ✅ **Inventário** - Implementado e testado
- ✅ **Carrinho** - Implementado e testado
- ✅ **Checkout** - **NOVO**: Implementado e testado
- ✅ **Finalização** - **NOVO**: Implementado e testado
- ✅ **Validações** - **NOVO**: Implementado e testado
- ✅ **Múltiplos Produtos** - **NOVO**: Implementado e testado

**🎯 O fluxo completo de compra está agora 100% implementado e testado!**