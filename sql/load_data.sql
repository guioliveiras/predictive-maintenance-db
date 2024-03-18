-- Drop schema e criação
DROP SCHEMA IF EXISTS kaggle CASCADE;
CREATE SCHEMA IF NOT EXISTS kaggle;

-- Criando a tabela "machines"
CREATE TABLE kaggle.machines (
    machineID SMALLINT PRIMARY KEY,
    model VARCHAR(10) NOT NULL,
    age INT NOT NULL
);

-- Criando a tabela "errors"
CREATE TABLE kaggle.errors (
	error_id SMALLINT PRIMARY KEY,
	datetime TIMESTAMP NOT NULL,
	machineID SMALLINT REFERENCES kaggle.machines(machineID) NOT NULL,
	errorID VARCHAR NOT NULL
);

-- Criando a tabela "failures"
CREATE TABLE kaggle.failures (
    failure_id SERIAL PRIMARY KEY,
    datetime TIMESTAMP NOT NULL,
    machineID INT REFERENCES kaggle.machines(machineID) NOT NULL,
    failure VARCHAR(10) NOT NULL
);

-- Criando a tabela "maint"
CREATE TABLE kaggle.maint (
    maint_id SERIAL PRIMARY KEY,
    datetime TIMESTAMP NOT NULL,
    machineID INT REFERENCES kaggle.machines(machineID) NOT NULL,
    component VARCHAR(10) NOT NULL
);

-- Criando a tabela "telemetry"
CREATE TABLE kaggle.telemetry (
    datetime TIMESTAMP,
    machineID INT REFERENCES kaggle.machines(machineID),
    volt FLOAT NOT NULL,
    rotate FLOAT NOT NULL,
    pressure FLOAT NOT NULL,
    vibration FLOAT NOT NULL,
    PRIMARY KEY (machineID, datetime)
);

-- Copiando os dados dos arquivos para as tabelas.
COPY kaggle.machines FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_machines.csv' DELIMITER ',' CSV HEADER;
COPY kaggle.errors (datetime, machineID, errorID) FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_errors.csv' DELIMITER ',' CSV HEADER;
COPY kaggle.failures (datetime, machineID, failure) FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_failures.csv' DELIMITER ',' CSV HEADER;
COPY kaggle.maint (datetime, machineID, component) FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_maint.csv' DELIMITER ',' CSV HEADER;
COPY kaggle.telemetry  FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_telemetry.csv' DELIMITER ',' CSV HEADER;
