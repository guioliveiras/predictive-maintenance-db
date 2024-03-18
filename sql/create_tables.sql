drop schema if exists maintenance_data cascade;

create schema maintenance_data;

-- components
create table maintenance_data.components (
	component_key smallserial primary key,
	component_name varchar(10)
);

insert into maintenance_data.components (component_name)
select distinct failure from kaggle.failures order by failure;

-- component-failure
create table maintenance_data.failures as (
select 
failure_id,
datetime,
machineid,
c.component_key
from kaggle.failures f 
left join maintenance_data.components c
on f.failure = c.component_name
);

-- primary key
alter table maintenance_data.failures 
add constraint pk_failure_id
primary key(failure_id);

-- component_fk
alter table maintenance_data.failures 
add constraint fk_component_key
foreign key (component_key)
references maintenance_data.components(component_key);

-- component-maint
create table maintenance_data.maint as (
select 
maint_id,
datetime,
machineid as machine_id,
c.component_key 
from kaggle.maint m 
left join maintenance_data.components c 
	on c.component_name = m.component 
);

-- primary-key
alter table maintenance_data.maint 
add constraint pk_maint_id
primary key(maint_id);


-- component-fk
alter table maintenance_data.maint 
add constraint fk_component_key
foreign key (component_key)
references maintenance_data.components(component_key);

-- errors
create table maintenance_data.error (
	error_key serial primary key,
	error_id varchar(10)
);

insert into maintenance_data.error (error_id)
select distinct errorid  from kaggle.errors order by errorid;

-- error-machine
create table maintenance_data.error_machine as (
select 
em.error_id as error_machine_id,
em.datetime,
em.machineid as machine_id,
e.error_key
from kaggle.errors em 
left join maintenance_data.error e 
	on em.errorid  = e.error_id 
);

-- error-machine-pk
alter table maintenance_data.error_machine 
add constraint pk_error_machine_id
primary key(error_machine_id);

-- error-key-fk
alter table maintenance_data.error_machine 
add constraint fk_error_key
foreign key (error_key)
references maintenance_data.error(error_key);


-- models
create table maintenance_data.models (
	model_id smallserial primary key,
	model varchar(10) not null
);


insert into maintenance_data.models (model)
select distinct model from kaggle.machines order by model;


-- machine
create table maintenance_data.machine  as (
select 
m.machineid as machine_id,
mds.model_id,
2024 - m.age as manufacture_year
from kaggle.machines m 
left join maintenance_data.models mds
	on mds.model = m.model
);

-- machine-pk
alter table maintenance_data.machine 
add constraint pk_machine_id
primary key (machine_id);

-- model-fk
alter table maintenance_data.machine
add constraint fk_model_id
foreign key (model_id)
references maintenance_data.models(model_id);

-- maint-machine-fk
alter table maintenance_data.maint 
add constraint fk_machine_id
foreign key (machine_id)
references maintenance_data.machine(machine_id);

-- failures-machine-fk
alter table maintenance_data.failures 
add constraint fk_machine_id
foreign key (machineid)
references maintenance_data.machine(machine_id);

-- error_machine-machine-fk
alter table maintenance_data.error_machine 
add constraint fk_machine_id
foreign key (machine_id)
references maintenance_data.machine(machine_id);

-- telemetry
CREATE TABLE maintenance_data.telemetry (
    telemetry_id serial primary key,
    machine_id smallint not null,
    datetime timestamp not null,
    volt decimal(16, 13) not null,
    rotate decimal(16, 13)  not null,
    pressure decimal(16, 13)  not null,
    vibration decimal(15, 13)  not null
);

insert into maintenance_data.telemetry (machine_id, datetime, volt, rotate, pressure, vibration)
select
machineid,
datetime,
volt,
rotate,
pressure,
vibration
from
kaggle.telemetry;

-- telemetry-pk
alter table maintenance_data.telemetry
add constraint fk_machine_id
foreign key (machine_id)
references maintenance_data.machine(machine_id);