# Projeto: Rede Social Profissional de Portfólio

## Descrição do Projeto e Requisitos Funcionais

Neste projeto foi-nos pedido um website ao estilo de uma rede social com informações relativas ao portfólio dos seus utilizadores parecida à rede social "LinkedIn".

### Tecnologias Utilizadas
- **Servidor**: Framework Express.js do Node.js
- **Base de Dados**: MYSQL chamada `proj_pw_202100190_202100242`, conectada ao servidor através do módulo `mysql` e processada via pedidos AJAX com arquitetura RESTful.
- **Ícones**: Biblioteca Font Awesome

### Funcionalidades Gerais
- **Homepage (index)**: Contém uma descrição do website, formulários de login/sign-up para profissionais, empresas e administradores.
- **Registros**: Feitos via chamadas AJAX que comunicam com o model e inserem dados na base de dados. O registro de empresas necessita de aprovação de um administrador.
- **Sistema de Login**: Utiliza o módulo `express-session` para criar uma sessão no servidor com o email do utilizador. A sessão é mantida até o utilizador fazer log-out.

### Funcionalidades para Profissionais
- **Página Home**: Profissionais podem enviar, aceitar ou rejeitar pedidos de amizade de outros profissionais.
- **Página Job Offers**: Lista de ofertas de emprego com barra de pesquisa funcional e opção de ordenar ofertas por salário.
- **Página Profile**: Página de portfólio do utilizador com botões para editar/adicionar informações, descrição, experiências profissionais e percurso de educação. Processamento via AJAX.
- **Página About Us / Team**: Descrição dos elementos da equipa.
- **Visualização de Portfólios**: Profissionais podem visualizar seu próprio portfólio ou de amigos.

### Funcionalidades para Empresas
- **Página Portfolios**: Lista de utilizadores com portfólios visíveis e acessíveis a empresas. Possibilidade de pesquisa por idade, localidade, função e nome.
- **Página Profile**: Perfil da empresa com opção de editar/adicionar dados.
- **Página About Us / Team**: Descrição dos elementos da equipa.
- **Visualização de Portfólios**: Empresas podem ver a lista de utilizadores com portfólios visíveis.

### Funcionalidades para Administradores
- **Página Approve Companies**: Aprovação ou rejeição de empresas registadas, com opção de desativar contas.
- **Página Portfolios**: Lista de utilizadores com barra de pesquisa. Possibilidade de visualizar o portfólio dos utilizadores.

### Dados da Conta de Administrador
- **Email**: admin@folio.com
- **Password**: admin
