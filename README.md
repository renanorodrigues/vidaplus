# API VidaPlus

API REST de Backend para o sistema VidaPlus, uma plataforma completa de gerenciamento de saúde que facilita a interação entre pacientes, profissionais de saúde e unidades médicas.

## 📋 Sobre o Projeto

O VidaPlus é um sistema projetado para gerenciar todo o ecossistema de saúde, incluindo:

- **Gestão de Pacientes**: Cadastro completo com prontuários eletrônicos
- **Gestão de Profissionais**: Médicos, enfermeiros e outros profissionais de saúde
- **Agendamento de Consultas**: Sistema completo de agendas e marcações
- **Receitas Médicas**: Prescrições digitais vinculadas a consultas
- **Unidades Médicas**: Gestão de hospitais, clínicas e consultórios
- **Auditoria**: Sistema de rastreamento de alterações (PaperTrail)

## 🚀 Tecnologias

- **Ruby**: 3.2.0
- **Rails**: 8.0.2
- **Banco de Dados**: PostgreSQL 17
- **Autenticação**: JWT (JSON Web Tokens) + BCrypt
- **Servidor**: Puma
- **Containerização**: Docker + Docker Compose
- **Auditoria**: PaperTrail

## 📦 Pré-requisitos

Antes de começar, você precisará ter instalado em sua máquina:

### Opção 1: Usando Docker (Recomendado)
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Opção 2: Instalação Local
- Ruby 3.2.0 (recomendado usar [rbenv](https://github.com/rbenv/rbenv) ou [rvm](https://rvm.io/))
- PostgreSQL 13+
- Bundler (`gem install bundler`)

## 🔧 Instalação e Configuração

### Usando Docker (Recomendado)

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/seu-usuario/vidaplus.git
   cd vidaplus
   ```

2. **Suba os containers:**
   ```bash
   docker-compose up -d
   ```

3. **Configure o banco de dados:**
   ```bash
   docker-compose exec api rails db:create
   docker-compose exec api rails db:migrate
   docker-compose exec api rails db:seed  # (opcional) para popular com dados iniciais
   ```

4. **Acesse a aplicação:**
   - API: http://localhost:3000
   - PostgreSQL: localhost:5432

5. **Para visualizar logs:**
   ```bash
   docker-compose logs -f api
   ```

### Instalação Local

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/seu-usuario/vidaplus.git
   cd vidaplus
   ```

2. **Instale a versão correta do Ruby:**
   ```bash
   rbenv install 3.2.0  # ou rvm install 3.2.0
   rbenv local 3.2.0    # ou rvm use 3.2.0
   ```

3. **Instale as dependências:**
   ```bash
   bundle install
   ```

4. **Configure as variáveis de ambiente:**
   
   Certifique-se de que o PostgreSQL esteja rodando localmente. Você pode configurar as credenciais através de variáveis de ambiente:
   ```bash
   export DB_USERNAME=postgres
   export DB_PASSWORD=postgres
   export DB_HOST=localhost
   ```

5. **Configure o banco de dados:**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed  # (recomendado para já testar a aplicação)
   ```

6. **Inicie o servidor:**
   ```bash
   rails server
   ```
   ou
   ```bash
   rails s
   ```

7. **Acesse a aplicação:**
   - API: http://localhost:3000


## 📚 Documentação da API

### Health Check

- `GET /up`: Verifica o status da aplicação

### Autenticação

Todos os endpoints (exceto signup e signin) requerem autenticação via JWT.

- `GET /auth/signin`: Login de usuários
  ```json
  {
    "email": "usuario@exemplo.com",
    "password": "senha123"
  }
  ```

- `GET /auth/signup`: Registro de novos usuários
  ```json
  {
    "email": "usuario@exemplo.com",
    "password": "senha123"
  }
  ```

### Endpoints da API v1

Todos os endpoints abaixo estão sob o namespace `/api/v1`

#### Usuários
- `GET /api/v1/usuarios`: Lista todos os usuários
- `GET /api/v1/usuarios/:id`: Detalhes de um usuário
- `POST /api/v1/usuarios`: Cria um novo usuário
- `PUT /api/v1/usuarios/:id`: Atualiza um usuário
- `DELETE /api/v1/usuarios/:id`: Remove um usuário

#### Administradores
- `GET /api/v1/administradores`: Lista administradores
- `GET /api/v1/administradores/:id`: Detalhes de um administrador
- `POST /api/v1/administradores`: Cria um administrador
- `PUT /api/v1/administradores/:id`: Atualiza um administrador
- `DELETE /api/v1/administradores/:id`: Remove um administrador

#### Pacientes
- `GET /api/v1/pacientes`: Lista todos os pacientes
- `GET /api/v1/pacientes/:id`: Detalhes de um paciente
- `POST /api/v1/pacientes`: Cria um novo paciente
- `PUT /api/v1/pacientes/:id`: Atualiza um paciente
- `DELETE /api/v1/pacientes/:id`: Remove um paciente

#### Consultas (aninhado em Pacientes)
- `GET /api/v1/pacientes/:paciente_id/consultas`: Lista consultas de um paciente
- `POST /api/v1/pacientes/:paciente_id/consultas`: Agenda uma consulta
- `GET /api/v1/pacientes/:paciente_id/consultas/:id`: Detalhes de uma consulta
- `PUT /api/v1/pacientes/:paciente_id/consultas/:id`: Atualiza uma consulta
- `DELETE /api/v1/pacientes/:paciente_id/consultas/:id`: Cancela uma consulta

#### Profissionais
- `GET /api/v1/profissionais`: Lista profissionais
- `GET /api/v1/profissionais/:id`: Detalhes de um profissional
- `POST /api/v1/unidade_medicas/:unidade_medica_id/profissionais`: Cria profissional vinculado a unidade
- `PUT /api/v1/profissionais/:id`: Atualiza um profissional
- `DELETE /api/v1/profissionais/:id`: Remove um profissional

#### Agendas (aninhado em Profissionais)
- `GET /api/v1/profissionais/:profissional_id/agendas`: Lista agendas
- `POST /api/v1/profissionais/:profissional_id/agendas`: Cria uma agenda
- `GET /api/v1/profissionais/:profissional_id/agendas/:id`: Detalhes de agenda
- `PUT /api/v1/profissionais/:profissional_id/agendas/:id`: Atualiza agenda
- `DELETE /api/v1/profissionais/:profissional_id/agendas/:id`: Remove agenda

#### Receitas
- `GET /api/v1/profissionais/:profissional_id/receitas`: Receitas emitidas por profissional
- `GET /api/v1/pacientes/:paciente_id/receitas/:id`: Visualizar receita do paciente
- `POST /api/v1/profissionais/:profissional_id/receitas`: Emite uma receita
- `PUT /api/v1/profissionais/:profissional_id/receitas/:id`: Atualiza receita
- `DELETE /api/v1/profissionais/:profissional_id/receitas/:id`: Remove receita

#### Prontuários (aninhado em Profissionais)
- `GET /api/v1/profissionais/:profissional_id/prontuarios`: Lista prontuários
- `POST /api/v1/profissionais/:profissional_id/prontuarios`: Cria prontuário
- `GET /api/v1/profissionais/:profissional_id/prontuarios/:id`: Detalhes
- `PUT /api/v1/profissionais/:profissional_id/prontuarios/:id`: Atualiza
- `DELETE /api/v1/profissionais/:profissional_id/prontuarios/:id`: Remove

#### Unidades Médicas
- `GET /api/v1/unidade_medicas`: Lista unidades médicas
- `GET /api/v1/unidade_medicas/:id`: Detalhes de uma unidade
- `POST /api/v1/unidade_medicas`: Cria uma unidade médica
- `PUT /api/v1/unidade_medicas/:id`: Atualiza unidade
- `DELETE /api/v1/unidade_medicas/:id`: Remove unidade

#### Auditoria
- `GET /api/v1/auditorias`: Lista histórico de alterações
- `GET /api/v1/auditorias/:id`: Detalhes de uma alteração específica

## 🗄️ Schema do Banco de Dados

O banco de dados da aplicação é composto pelas seguintes tabelas:

- **usuarios**: Dados de autenticação (email, senha)
- **administradores**: Administradores do sistema
- **pacientes**: Informações completas dos pacientes (dados pessoais, contatos, endereço)
- **profissionais**: Dados dos profissionais de saúde (médicos, enfermeiros, etc.)
- **unidade_medicas**: Hospitais, clínicas e consultórios
- **profissional_unidade_medicas**: Relacionamento N:N entre profissionais e unidades
- **agendas**: Disponibilidade de horários dos profissionais
- **consultas**: Agendamentos de consultas
- **prontuarios**: Histórico clínico dos pacientes
- **receitas**: Prescrições médicas
- **relatorios**: Relatórios do sistema
- **versions**: Auditoria de alterações (PaperTrail)

Para mais detalhes sobre colunas e relacionamentos, consulte `db/schema.rb`.

## 🛠️ Comandos Úteis

### Com Docker
```bash
# Parar containers
docker-compose down

# Reiniciar aplicação
docker-compose restart api

# Acessar console Rails
docker-compose exec api rails console

# Executar migrations
docker-compose exec api rails db:migrate

# Ver status do banco
docker-compose exec api rails db:migrate:status
```

### Local
```bash
# Console Rails
rails console

# Executar migrations
rails db:migrate

# Rollback última migration
rails db:rollback

# Ver rotas disponíveis
rails routes

# Limpar e recriar banco
rails db:reset
```

## 🔒 Variáveis de Ambiente

| Variável | Descrição | Padrão |
|----------|-----------|--------|
| `DB_USERNAME` | Usuário do PostgreSQL | `postgres` |
| `DB_PASSWORD` | Senha do PostgreSQL | `postgres` |
| `DB_HOST` | Host do banco de dados | `localhost` |
| `RAILS_MAX_THREADS` | Número máximo de threads | `5` |

## Como testar
Existe uma collection do Insomnia já pronta para testar todas as rotas do projeto. Você pode copiar o arquivo na pasta raíz deste repositório de nome: `collection_vidaplus.yaml`. Nisso, importe no Insomnia e realize seus testes! 
Para facilitar seus testes, não deixe de executar o `rails db:seed` para já ter acesso à usuários com seus papéis configurados.


## 📄 Licença

Este projeto está sob a licença especificada no arquivo [LICENSE](LICENSE).
