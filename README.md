🏎️ Sistema de Gerenciamento de Campeonato de Kart

Este repositório contém o script SQL para criação, povoamento e manipulação de um banco de dados relacional voltado ao gerenciamento de campeonatos de kart.

O projeto abrange desde a modelagem do banco de dados (tabelas de pilotos, equipes, patrocínios, etapas e temporadas) até comandos de inserção, atualização e remoção de dados.

📌 Estrutura do Banco de Dados

O banco de dados kart é composto pelas seguintes tabelas e relacionamentos:

patrocinio: Armazena as marcas patrocinadoras.

equipe: Registra as equipes participantes e o vínculo com o seu patrocinador (idpatrocinio).

piloto: Guarda informações sobre os pilotos (nome, peso, capitão, nacionalidade) e sua equipe (idequipe).

temporada: Identifica as edições do campeonato.

etapa: Armazena o local, data e hora de cada corrida associada a uma temporada (idtemporada).

etapa_has_piloto: Tabela associativa que relaciona a participação dos pilotos nas etapas.

🛠️ Tecnologias Utilizadas

SGBD: MySQL

Linguagem: SQL (DDL e DML)

🚀 Como Executar o Projeto

Pré-requisitos

Ter o MySQL Server instalado.

Alguma ferramenta de gerenciamento como MySQL Workbench, DBeaver ou via linha de comando (CLI).

Passos

Clone este repositório:

git clone https://github.com/seu-usuario/seu-repositorio.git


Acesse a pasta do projeto:

cd seu-repositorio


Execute o script SQL:

Abra o arquivo Atividade_kart 2024 Gustavo.sql em seu cliente MySQL preferido e execute todo o script.

Ou via linha de comando:

mysql -u seu_usuario -p < "Atividade_kart 2024 Gustavo.sql"


🔍 Principais Operações Incluídas no Script

Criação de Tabelas: Definição das chaves primárias, estrangeiras e restrições de integridade relacional.

Inserção de Dados: Carga inicial com registros de patrocínios, equipes, temporadas, corridas e pilotos.

Atualização de Dados (UPDATE):

Atualização dos locais de etapas (ex: alteração de Campo Grande para Salvador e Londrina para Goiânia).

Remoção do patrocínio de uma equipe específica.

Exclusão de Dados (DELETE): Remoção de patrocinadores desvinculados.

Consultas (SELECT): Listagem de pilotos cadastrados no sistema.

👤 Autor

Desenvolvido por Gustavo.

Sinta-se à vontade para contribuir com sugestões de melhoria ou novas funcionalidades abrindo uma PR!
