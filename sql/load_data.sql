drop schema if exists kaggle cascade;

create schema if not exists kaggle;

-- Criando a tabela machines
create table kaggle.machines (
	machineID smallint primary key,
	model varchar(10) not null,
	age int not null
);

-- Criando a tabela errors
create table kaggle.errors (
	error_id serial primary key,
	datetime timestamp not null,
	machineID int references kaggle.machines(machineID) not null,
	errorID varchar not null
);

-- Criando a tabela failures
create table kaggle.failures(
	failure_id serial primary key,
	datetime timestamp not null,
	machineID int references kaggle.machines(machineID) not null,
	failure varchar(10) not null
);

-- Criando a tabela maint
create table kaggle.maint(
	maint_id serial primary key,
	datetime timestamp not null,
	machineID int references kaggle.machines(machineID) not null,
	component varchar(10) not null
);

-- Criando a tabela telemetry
create table kaggle.telemetry(
	datetime timestamp,
	machineID int references kaggle.machines(machineID),
	volt float not null,
	rotate float not null,
	pressure float not null,
	vibration float not null,
	primary key (machineID, datetime)
);

-- Copiando os dados dos arquivos para as tabelas.
\COPY kaggle.machines FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_machines.csv' DELIMITER ',' CSV HEADER;
\COPY kaggle.errors (datetime, machineID, errorID) FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_errors.csv' DELIMITER ',' CSV HEADER;
\COPY kaggle.failures (datetime, machineID, failure) FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_failures.csv' DELIMITER ',' CSV HEADER;
\COPY kaggle.maint (datetime, machineID, component) FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_maint.csv' DELIMITER ',' CSV HEADER;
\COPY kaggle.telemetry  FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_telemetry.csv' DELIMITER ',' CSV HEADER;
