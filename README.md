# Microsoft Azure Predictive Maintenance

<img src=”https://github.com/guioliveiras/predictive-maintenance-db/blob/main/imgs/maitenance.png”>

## Sobre o Projeto

O "Predictive Maintenance Database" é um projeto de estudo focado na criação de um banco de dados relacional para suportar as informações dos processos de manutenção preditiva de máquinas.

O projeto inclui o Modelo Entidade Relacionamento (MER) seguindo os padrões de normalização de bancos de dados (1FN, 2FN e 3FN), e desenvolvimento de scripts SQL para  implementação física no PostgreSQL.

Os conjuntos de dados utilizados neste projeto podem ser encontrados no [Kaggle](https://www.kaggle.com), disponíveis para referência e análise.

🔗 [Microsoft Azure Predictive Maintenance](https://www.kaggle.com/datasets/arnabbiswas1/microsoft-azure-predictive-maintenance)

## 🗂️ Estrutura do Projeto

O projeto está organizado da seguinte forma:

- **sql**: Scripts SQL para carga de dados e criação de tabelas.
- **data**: Dados utilizados no projeto, obtidos do Kaggle.
- **diagrams**: Modelos ER dos bancos de dados.

## 📄 Descrição dos Arquivos

`create_tables.sql`: Script SQL para criação das tabelas no PostgreSQL.

`load_data.sql`: Script SQL para carga de dados de  nas tabelas.

## 📄 Descrição das Tabelas

`PdM_telemetry.csv`: Consiste na média horária de tensão, rotação, pressão e vibração coletada de 100 máquinas.

`PdM_errors.csv`: São os erros encontrados pelas máquinas durante o funcionamento.

`PdM_maint.csv`: Registra as manutenções realizadas nas máquinas.

`PdM_failures.csv`: Registra as falhas nas máquinas.

`PdM_Machines.csv`: Metadados das máquinas, como tipo de modelo e idade.

## Uso

[Inserir instruções de instalação, configuração do banco de dados, execução dos scripts, etc.]

## Próximos Passos

- [x] Some task
- [ ] Some more task
- [ ] Some more more task

## Contato
