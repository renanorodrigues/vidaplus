# API VidaPlus

API de Backend para o sistema VidaPlus, uma plataforma de gerenciamento de saúde.

## Sobre o Projeto

O VidaPlus é um sistema projetado para facilitar a interação entre pacientes, profissionais de saúde e unidades médicas. A API fornece os endpoints necessários para gerenciar informações de pacientes, prontuários, agendamentos e muito mais.

## Como Começar

Para rodar o projeto localmente, siga os seguintes passos:

1.  **Clone o repositório:**
    ```bash
    git clone <URL_DO_REPOSITORIO>
    ```
2.  **Instale as dependências:**
    ```bash
    bundle install
    ```
3.  **Configure o banco de dados:**
    ```bash
    rails db:create
    rails db:migrate
    ```
4.  **Inicie o servidor:**
    ```bash
    rails s
    ```

A API estará disponível em `http://localhost:3000`.

## Endpoints da API

A seguir estão os principais endpoints da API, com detalhes sobre como utilizá-los.

### Autenticação

*   `GET /auth/signin`: Endpoint para login de usuários.
*   `GET /auth/signup`: Endpoint para registro de novos usuários.

### Usuários

*   `POST /api/v1/usuarios`: Cria um novo usuário.
*   `PUT /api/v1/usuarios/:id`: Atualiza um usuário existente.
*   `DELETE /api/v1/usuarios/:id`: Remove um usuário.

### Pacientes

*   `GET /api/v1/pacientes`: Lista todos os pacientes.
*   `GET /api/v1/pacientes/:id`: Retorna os detalhes de um paciente específico.
*   `POST /api/v1/pacientes`: Cria um novo paciente.
*   `PUT /api/v1/pacientes/:id`: Atualiza um paciente existente.
*   `DELETE /api/v1/pacientes/:id`: Remove um paciente.

#### Prontuários

*   `POST /api/v1/pacientes/:paciente_id/prontuarios`: Cria um novo prontuário para um paciente.

## Schema do Banco de Dados

O banco de dados da aplicação é composto pelas seguintes tabelas:

*   `administradores`
*   `agendas`
*   `pacientes`
*   `pedidos`
*   `profissionais`
*   `profissional_unidade_medicas`
*   `prontuarios`
*   `receitas`
*   `relatorios`
*   `unidade_medicas`
*   `usuarios`

Para mais detalhes sobre as colunas e relacionamentos, consulte o arquivo `db/schema.rb`.

## Dependências

Este projeto utiliza as seguintes Gems:

*   **rails**: Framework principal da aplicação.
*   **pg**: Adapter para o banco de dados PostgreSQL.
*   **puma**: Servidor web.
*   **bcrypt**: Para criptografia de senhas.
*   **jwt**: Para autenticação baseada em JSON Web Tokens.

Para a lista completa de dependências, consulte o arquivo `Gemfile`.
