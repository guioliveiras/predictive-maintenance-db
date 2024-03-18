# Predictive Maintenance Database

## Sobre o Projeto

O "Predictive Maintenance Database" é um projeto de estudo focado na criação de um banco de dados relacional para suportar processos de manutenção preditiva em máquinas industriais. Utilizando dados coletados de sensores e históricos de manutenção, o objetivo é prever falhas e planejar intervenções antes que ocorram paradas não planejadas na produção.

O projeto inclui modelagem de dados seguindo as normas de normalização de bancos de dados (1FN, 2FN e 3FN), implementação física no PostgreSQL e desenvolvimento de consultas SQL para análise preditiva. Além disso, é apresentada uma solução comercial detalhada, destacando os benefícios da abordagem de manutenção preditiva.

Os conjuntos de dados utilizados neste projeto podem ser encontrados no [Kaggle](https://www.kaggle.com), disponíveis para referência e análise.

🔗 [Microsoft Azure Predictive Maintenance](https://www.kaggle.com/datasets/arnabbiswas1/microsoft-azure-predictive-maintenance)


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

Para melhor compreensão, foi criado um dicionário de dados contendo os nomes de todas as tabelas com detalhamento de cada atributo definido.

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

- Certifique-se de aplicar todas as chaves primárias e estrangeiras corretamente durante a execução dos scripts SQL.
