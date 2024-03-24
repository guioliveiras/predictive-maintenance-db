# Predictive Maintenance Database

![Microsoft Azure Predictive Maintenance](https://github.com/guioliveiras/predictive-maintenance-db/blob/main/imgs/maitenance.png?raw=true)

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

Para utilizar este projeto, siga estas etapas:

1. Clone o repositório no GitHub com o seguinte comando:

```bash
git clone https://github.com/guioliveiras/predictive-maintenance-db.git
cd predictive-maintenance-db
```

2. Certifique-se de ter o PostgreSQL instalado e em funcionamento.

3. Crie um banco de dados vazio no PostgreSQL ou utilize um de sua escolha.

4. Acesse a pasta `sql` do projeto.

5. Alter o caminho do diretório do COPY no script SQL `load_data.sql` para o onde estão seus arquivos.

6. Execute o script SQL `load_data.sql` para importar os dados dos arquivos CSV.

7. Execute o script SQL `create_tables.sql` para criar as tabelas no banco de dados.

8. Agora você pode fazer consultas e realizar análises nas tabelas do banco de dados.

## Próximos Passos

- [x] Modelagem e nomalização do banco de dados
- [ ] Análise de dados

## Contato

<a href="https://www.linkedin.com/in/silvaguilhermeoliveira/" alt="Linkedin">
<img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a>

<a href="mailto:silva.guilhermeoliveira@gmail.com" alt="Gmail">
<img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" /></a>

<a href="https://medium.com/@guioliveiras" alt="Medium">
<img src="https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white" /></a>

