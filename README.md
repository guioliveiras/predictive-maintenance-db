# Predictive Maintenance Database

## Sobre o Projeto

Este repositório contém um projeto de modelagem de banco de dados para manutenção preditiva de máquinas. A equipe foi encarregada de criar um modelo Entidade-Relacionamento (ER) e transformá-lo em um modelo físico para o PostgreSQL, com o objetivo de abrigar dados relacionados a condições de uso da máquina, histórico de falhas, histórico de manutenção e características da máquina.

## 🗂️ Estrutura do Projeto

O projeto está organizado da seguinte forma:

- **docs**: Contém a apresentação comercial detalhando a solução proposta.
- **sql**: Scripts SQL para criação de tabelas, carga de dados e consultas para análise.
- **data**: Dados utilizados no projeto, obtidos do Kaggle.
- **diagrams**: Diagramas de modelo ER e físico do banco de dados.

## 📄 Descrição dos Arquivos

- `create_tables.sql`: Script SQL para criação das tabelas no PostgreSQL.
- `load_data.sql`: Script SQL para carga de dados de exemplo nas tabelas.
- `queries.sql`: Consultas SQL para análise dos dados.
- `Apresentacao_comercial.pdf`: Apresentação comercial para a equipe técnica do cliente.

## 📄 Dicionário de Dados

Para melhor compreensão, foi criado dicionário de dados contendo os nomes de todas as tabelas com detalhamento de cada atributo definido.

🔗 [Dicionário](https://github.com/guioliveiras/predictive-maintenance-db/blob/main/docs/dicionario_de_dados.pdf)

**Descrição das Tabelas:**

`PdM_telemetry.csv`: Consiste na média horária de tensão, rotação, pressão e vibração coletada de 100 máquinas para o ano de 2015.

`PdM_errors.csv`: São os erros encontrados pelas máquinas durante o funcionamento.

`PdM_maint.csv`: Registra as manutenções realizadas nas máquinas.

`PdM_failures.csv`: Registra as falhas nas máquinas.

`PdM_Machines.csv`: Metadados das máquinas, como tipo de modelo e idade.

## Uso

[Inserir instruções de instalação, configuração do banco de dados, execução dos scripts, etc.]

## Observações

- Os dados utilizados neste projeto foram obtidos do Kaggle e estão disponíveis para referência.
- Certifique-se de aplicar todas as chaves primárias e estrangeiras corretamente durante a execução dos scripts SQL.
