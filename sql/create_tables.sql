-- Drop schema e criação
DROP SCHEMA IF EXISTS maintenance_data CASCADE;
CREATE SCHEMA maintenance_data;

-- Criação da tabela "components"
CREATE TABLE maintenance_data.components (
    component_key SMALLSERIAL PRIMARY KEY,
    component_name VARCHAR(10)
);

-- Inserção de dados na tabela "components"
INSERT INTO maintenance_data.components (component_name)
SELECT DISTINCT failure FROM kaggle.failures ORDER BY failure;

-- Criação da tabela "failures"
CREATE TABLE maintenance_data.failures AS (
    SELECT 
        failure_id,
        datetime,
        machineid,
        c.component_key
    FROM kaggle.failures f 
    LEFT JOIN maintenance_data.components c ON f.failure = c.component_name
);

-- Definição de chaves primárias e estrangeiras para a tabela "failures"
ALTER TABLE maintenance_data.failures 
    ADD CONSTRAINT pk_failure_id PRIMARY KEY(failure_id),
    ADD CONSTRAINT fk_component_key FOREIGN KEY (component_key) REFERENCES maintenance_data.components(component_key);

-- Criação da tabela "maint"
CREATE TABLE maintenance_data.maint AS (
    SELECT 
        maint_id,
        datetime,
        machineid AS machine_id,
        c.component_key 
    FROM kaggle.maint m 
    LEFT JOIN maintenance_data.components c ON c.component_name = m.component 
);

-- Definição de chaves primárias e estrangeiras para a tabela "maint"
ALTER TABLE maintenance_data.maint 
    ADD CONSTRAINT pk_maint_id PRIMARY KEY(maint_id),
    ADD CONSTRAINT fk_component_key FOREIGN KEY (component_key) REFERENCES maintenance_data.components(component_key);

-- Criação da tabela "error"
CREATE TABLE maintenance_data.error (
    error_key SERIAL PRIMARY KEY,
    error_id VARCHAR(10)
);

-- Inserção de dados na tabela "error"
INSERT INTO maintenance_data.error (error_id)
SELECT DISTINCT errorid FROM kaggle.errors ORDER BY errorid;

-- Criação da tabela "error_machine"
CREATE TABLE maintenance_data.error_machine AS (
    SELECT 
        em.error_id AS error_machine_id,
        em.datetime,
        em.machineid AS machine_id,
        e.error_key
    FROM kaggle.errors em 
    LEFT JOIN maintenance_data.error e ON em.errorid  = e.error_id 
);

-- Definição de chaves primárias e estrangeiras para a tabela "error_machine"
ALTER TABLE maintenance_data.error_machine 
    ADD CONSTRAINT pk_error_machine_id PRIMARY KEY(error_machine_id),
    ADD CONSTRAINT fk_error_key FOREIGN KEY (error_key) REFERENCES maintenance_data.error(error_key);

-- Criação da tabela "models"
CREATE TABLE maintenance_data.models (
    model_id SMALLSERIAL PRIMARY KEY,
    model VARCHAR(10) NOT NULL
);

-- Inserção de dados na tabela "models"
INSERT INTO maintenance_data.models (model)
SELECT DISTINCT model FROM kaggle.machines ORDER BY model;

-- Criação da tabela "machine"
CREATE TABLE maintenance_data.machine AS (
    SELECT 
        m.machineid AS machine_id,
        mds.model_id,
        2024 - m.age AS manufacture_year
    FROM kaggle.machines m 
    LEFT JOIN maintenance_data.models mds ON mds.model = m.model
);

-- Definição de chaves primárias e estrangeiras para a tabela "machine"
ALTER TABLE maintenance_data.machine 
    ADD CONSTRAINT pk_machine_id PRIMARY KEY (machine_id),
    ADD CONSTRAINT fk_model_id FOREIGN KEY (model_id) REFERENCES maintenance_data.models(model_id);

-- Definição de chaves estrangeiras para a tabela "maint", "failures", "error_machine"
ALTER TABLE maintenance_data.maint ADD CONSTRAINT fk_machine_id FOREIGN KEY (machine_id) REFERENCES maintenance_data.machine(machine_id);
ALTER TABLE maintenance_data.failures ADD CONSTRAINT fk_machine_id FOREIGN KEY (machineid) REFERENCES maintenance_data.machine(machine_id);
ALTER TABLE maintenance_data.error_machine ADD CONSTRAINT fk_machine_id FOREIGN KEY (machine_id) REFERENCES maintenance_data.machine(machine_id);

-- Criação da tabela "telemetry"
CREATE TABLE maintenance_data.telemetry (
    telemetry_id SERIAL PRIMARY KEY,
    machine_id SMALLINT NOT NULL,
    datetime TIMESTAMP NOT NULL,
    volt DECIMAL(16, 13) NOT NULL,
    rotate DECIMAL(16, 13) NOT NULL,
    pressure DECIMAL(16, 13) NOT NULL,
    vibration DECIMAL(15, 13) NOT NULL
);

-- Inserção de dados na tabela "telemetry"
INSERT INTO maintenance_data.telemetry (machine_id, datetime, volt, rotate, pressure, vibration)
SELECT
    machineid,
    datetime,
    volt,
    rotate,
    pressure,
    vibration
FROM kaggle.telemetry;

-- Definição de chave estrangeira para a tabela "telemetry"
ALTER TABLE maintenance_data.telemetry 
	ADD CONSTRAINT fk_machine_id FOREIGN KEY (machine_id) REFERENCES maintenance_data.machine(machine_id);






