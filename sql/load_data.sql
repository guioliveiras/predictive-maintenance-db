<<<<<<<<<<<<<<  ✨ Codeium Command 🌟 >>>>>>>>>>>>>>>>
+-- Creating schemas and tables
--- Drop schema e criação

DROP SCHEMA IF EXISTS kaggle CASCADE;
CREATE SCHEMA IF NOT EXISTS kaggle;

+-- Creating "machines" table
--- Criando a tabela "machines"
CREATE TABLE kaggle.machines (
+    machine_id SMALLINT PRIMARY KEY,
-    machineID SMALLINT PRIMARY KEY,
    model VARCHAR(10) NOT NULL,
    age INT NOT NULL
);

+-- Creating "errors" table
--- Criando a tabela "errors"
CREATE TABLE kaggle.errors (
+    error_id SMALLINT PRIMARY KEY,
+    datetime TIMESTAMP NOT NULL,
+    machine_id SMALLINT REFERENCES kaggle.machines(machine_id) NOT NULL,
+    error_id VARCHAR NOT NULL
-	error_id SMALLINT PRIMARY KEY,
-	datetime TIMESTAMP NOT NULL,
-	machineID SMALLINT REFERENCES kaggle.machines(machineID) NOT NULL,
-	errorID VARCHAR NOT NULL
);

+-- Creating "failures" table
--- Criando a tabela "failures"
CREATE TABLE kaggle.failures (
    failure_id SERIAL PRIMARY KEY,
    datetime TIMESTAMP NOT NULL,
+    machine_id INT REFERENCES kaggle.machines(machine_id) NOT NULL,
-    machineID INT REFERENCES kaggle.machines(machineID) NOT NULL,
    failure VARCHAR(10) NOT NULL
);

+-- Creating "maint" table
--- Criando a tabela "maint"
CREATE TABLE kaggle.maint (
    maint_id SERIAL PRIMARY KEY,
    datetime TIMESTAMP NOT NULL,
+    machine_id INT REFERENCES kaggle.machines(machine_id) NOT NULL,
-    machineID INT REFERENCES kaggle.machines(machineID) NOT NULL,
    component VARCHAR(10) NOT NULL
);

+-- Creating "telemetry" table
--- Criando a tabela "telemetry"
CREATE TABLE kaggle.telemetry (
    datetime TIMESTAMP,
+    machine_id INT REFERENCES kaggle.machines(machine_id),
-    machineID INT REFERENCES kaggle.machines(machineID),
    volt FLOAT NOT NULL,
    rotate FLOAT NOT NULL,
    pressure FLOAT NOT NULL,
    vibration FLOAT NOT NULL,
+    PRIMARY KEY (machine_id, datetime)
-    PRIMARY KEY (machineID, datetime)
);

+-- Copying data from files to tables
+COPY kaggle.machines FROM 'data/PdM_machines.csv' DELIMITER ',' CSV HEADER;
+COPY kaggle.errors FROM 'data/PdM_errors.csv' DELIMITER ',' CSV HEADER;
+COPY kaggle.failures FROM 'data/PdM_failures.csv' DELIMITER ',' CSV HEADER;
+COPY kaggle.maint FROM 'data/PdM_maint.csv' DELIMITER ',' CSV HEADER;
+COPY kaggle.telemetry FROM 'data/PdM_telemetry.csv' DELIMITER ',' CSV HEADER;
--- Copiando os dados dos arquivos para as tabelas.
-COPY kaggle.machines FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_machines.csv' DELIMITER ',' CSV HEADER;
-COPY kaggle.errors FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_errors.csv' DELIMITER ',' CSV HEADER;
-COPY kaggle.failures FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_failures.csv' DELIMITER ',' CSV HEADER;
-COPY kaggle.maint FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_maint.csv' DELIMITER ',' CSV HEADER;
COPY kaggle.telemetry FROM 'C:\Users\Guilherme\OneDrive\Documentos\projects\predictive-maintenance-db\data\PdM_telemetry.csv' DELIMITER ',' CSV HEADER;
<<<<<<<  2cda61db-618a-4fbe-8185-0fb1d75b07cf  >>>>>>>