# Cinema Automation Challenge - Robot Framework

## Sobre este Projeto

Este repositório foi criado como parte do desafio de automação de testes para uma aplicação de cinema, com o objetivo de praticar e demonstrar conhecimentos avançados em automação de testes web utilizando o **Robot Framework** com **Browser Library**.

O projeto foi desenvolvido com foco em:

- Estruturação de testes utilizando a abordagem Keyword-Driven
- Automação de interface web com Browser Library (Playwright)
- Testes funcionais de autenticação e reserva de filmes
- Geração de dados de teste dinâmicos com FakerLibrary
- Organização e execução de testes com tags
- Documentação completa de testes e keywords
- Boas práticas de automação e manutenibilidade

## Aplicação Testada

O projeto testa uma aplicação web de cinema que inclui:

- Sistema de autenticação (cadastro e login)
- Listagem e busca de filmes
- Visualização de perfil de usuário
- Funcionalidade de logout

## Estrutura do Projeto

```
cinema-challenge-robot/
├── resources/
│   ├── common_keywords.resource      # Keywords comuns e utilitários
│   ├── login_keywords.resource       # Keywords de autenticação
│   ├── cadastro_keywords.resource    # Keywords de cadastro
│   └── reserva_keywords.resource     # Keywords de reserva
├── tests/
│   ├── login_tests.robot            # Testes de autenticação
│   └── reserva_tests.robot          # Testes de reserva
├── variables/
│   └── env_variables.resource       # Variáveis de ambiente
├── results/                         # Relatórios de execução
└── requirements.txt                 # Dependências do projeto
```

## Instalação

1. Clone o repositório:
```bash
git clone <repository-url>
```

2. Acesse o diretório do projeto:
```bash
cd cinema-automation-challenge/cinema-challenge-robot
```

3. Crie o ambiente virtual:
```bash
python -m venv env
```

4. Ative o ambiente virtual:
```bash
# No Linux/macOS
source env/bin/activate

# No Windows (PowerShell)
.\env\Scripts\Activate.ps1
```

5. Instale as dependências:
```bash
pip install -r requirements.txt
```

6. Instale os navegadores do Playwright:
```bash
rfbrowser init
```

## Execução

### Executar todos os testes:
```bash
robot tests/
```

### Executar testes por tag:
```bash
# Apenas testes de autenticação
robot -i registration tests/

# Apenas testes funcionais
robot -i positive tests/

# Apenas testes críticos
robot -i smoke tests/
```

### Executar suite específica:
```bash
# Testes de login
robot tests/login_tests.robot

# Testes de reserva
robot tests/reserva_tests.robot
```

### Gerar relatórios em diretório específico:
```bash
robot -d results tests/
```

### Executar com diferentes níveis de log:
```bash
robot -L DEBUG tests/
robot -L INFO tests/
```

## Tags Disponíveis

| Tag | Descrição |
|-----|-----------|
| **Funcionalidade** |
| `registration` | Testes de cadastro de usuários |
| `login` | Testes de login |
| `logout` | Testes de logout |
| `profile` | Testes de perfil de usuário |
| `search` | Testes de busca de filmes |
| `listing` | Testes de listagem de filmes |
| `navigation` | Testes de navegação |
| `showtime` | Testes de horários |
| `seats` | Testes de seleção de assentos |
| `checkout` | Testes de finalização de compra |
| **Tipo de Teste** |
| `positive` | Cenários de sucesso |
| `negative` | Cenários de erro |
| `validation` | Testes de validação |
| `functional` | Testes funcionais |
| **Criticidade** |
| `smoke` | Testes de smoke (básicos) |
| `pending` | Funcionalidades pendentes |
| `security` | Testes de segurança |

## Tipos de Testes Implementados

### 1. Testes de Autenticação
- ✅ Cadastro de usuário com sucesso
- ✅ Cadastro com email duplicado
- ✅ Login com sucesso
- ✅ Cadastro com email inválido
- ✅ Cadastro com senha inválida
- ✅ Visualização de perfil
- ✅ Logout de usuário
- 🔄 Alteração de senha (pendente)

### 2. Testes de Reserva
- ✅ Pesquisa por filme
- 🔄 Verificação de carregamento da lista de filmes
- 🔄 Seleção de filme e navegação para horários
- 🔄 Verificação de horários disponíveis
- 🔄 Seleção de horário e navegação para assentos
- 🔄 Verificação do mapa de assentos
- 🔄 Seleção e desseleção de assentos
- 🔄 Tentativa de seleção de assento ocupado
- 🔄 Seleção de múltiplos assentos
- 🔄 Tentativa de seleção acima do limite
- 🔄 Navegação para checkout
- 🔄 Verificação de campos do checkout
- 🔄 Cálculo do preço total
- 🔄 Checkout com dados válidos
- 🔄 Checkout com email inválido
- 🔄 Checkout com campos vazios

## Boas Práticas Implementadas

1. **Arquitetura em Camadas**: Separação clara entre testes, keywords e variáveis
2. **Documentação Completa**: Todos os arquivos, suites e keywords documentados
3. **Reutilização de Código**: Keywords comuns extraídas para arquivos compartilhados
4. **Parametrização**: Keywords flexíveis com argumentos opcionais
5. **Geração de Dados**: Uso de FakerLibrary para dados dinâmicos
6. **Organização por Tags**: Sistema de tags para execução seletiva
7. **Tratamento de Erros**: Verificações robustas e recuperação de falhas
8. **Manutenibilidade**: Código limpo e bem estruturado

## Relatórios

Após a execução, os seguintes arquivos são gerados na pasta `results/`:

- `report.html` - Relatório visual dos resultados
- `log.html` - Log detalhado da execução
- `output.xml` - Dados estruturados dos resultados
- Screenshots automáticos em caso de falhas

## Configuração de Ambiente

O arquivo `variables/env_variables.resource` contém as configurações:

```robot
*** Variables ***
${BASE_URL}           http://localhost:3002/
${CADASTRO_EMAIL}     test01@test.com
${CADASTRO_PASSWORD}  test123
```

Ajuste conforme seu ambiente de teste.

## Contribuição

Para contribuir com o projeto:

1. Mantenha a estrutura de documentação
2. Use tags apropriadas nos testes
3. Implemente keywords reutilizáveis
4. Adicione verificações robustas
5. Documente mudanças significativas

## Tecnologias Utilizadas

- **Robot Framework** - Framework de automação
- **Browser Library** - Automação web com Playwright
- **FakerLibrary** - Geração de dados de teste
- **Python** - Linguagem base
- **Playwright** - Engine de automação web