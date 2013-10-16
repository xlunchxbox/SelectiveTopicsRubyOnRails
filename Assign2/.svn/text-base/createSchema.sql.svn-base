drop table if exists workers;
drop table if exists work_orders;

create table workers (
  id INTEGER primary key,
  first_name varchar(100),
  last_name varchar(100)
);

create table work_orders (
  id INTEGER primary key,
	worker_id INTEGER not null,
	work_details varchar(100),
	date_of_creation DATE,
	status varchar(100),
	status_update_date DATE 
);