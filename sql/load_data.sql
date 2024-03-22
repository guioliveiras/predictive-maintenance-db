-- SCHEMA: kaggle

DROP SCHEMA IF EXISTS kaggle CASCADE;

CREATE SCHEMA IF NOT EXISTS kaggle
    AUTHORIZATION postgres;

-- Criando a tabela 'machines'
CREATE TABLE kaggle.machines (
	machineid SMALLINT PRIMARY KEY,
	model VARCHAR(10) NOT NULL,
	age INT NOT NULL
);

-- Criando a tabela 'errors'
CREATE TABLE kaggle.erros (
	error_id SERIAL PRIMARY KEY,
	datetime TIMESTAMP NOT NULL,
	machineid SMALLINT REFERENCES kaggle.machines(machineid) NOT NULL,
	errorid VARCHAR(10) NOT NULL
);

-- Criando a tabela 'failures'
CREATE TABLE kaggle.failures (
	failure_id SERIAL PRIMARY KEY,
	datetime TIMESTAMP NOT NULL,
	machineid SMALLINT REFERENCES kaggle.machines(machineid) NOT NULL,
	failure VARCHAR(10) NOT NULL
);

-- Criando a tabela 'maint'
CREATE TABLE kaggle.maint (
	maint_id SERIAL PRIMARY KEY,
	datetime TIMESTAMP NOT NULL,
	machineid SMALLINT REFERENCES kaggle.machines(machineid) NOT NULL,
	comp VARCHAR(10) NOT NULL 		
);

-- Criando a tabela 'telemetry'
CREATE TABLE kaggle.telemetry (
	datetime TIMESTAMP NOT NULL,
	machineid SMALLINT REFERENCES kaggle.machines(machineid) NOT NULL,
	volt FLOAT NOT NULL,
	rotate FLOAT NOT NULL,
	pressure FLOAT NOT NULL,
	vibration FLOAT NOT NULL,
	PRIMARY KEY(machineid, datetime)
);

-- Copiando os os dados dos arquivos para as tabelas

COPY kaggle.machines FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_machines.csv' DELIMITER ',' CSV HEADER;
COPY kaggle.erros (datetime, machineid, errorid)FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_errors.csv' DELIMITER ',' CSV HEADER;
COPY kaggle.failures (datetime, machineid, failure) FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_failures.csv' DELIMITER ',' CSV HEADER;
COPY kaggle.maint (datetime, machineid, comp)FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_maint.csv' DELIMITER ',' CSV HEADER;
COPY kaggle.telemetry FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_telemetry.csv' DELIMITER ',' CSV HEADER;