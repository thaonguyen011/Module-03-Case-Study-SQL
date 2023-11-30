create database case_study;

use case_study;

create table division (
id int primary key auto_increment,
name varchar(45),
is_delete bit(1)
);

create table education_degree (
id int primary key auto_increment,
name varchar(45),
is_delete bit(1) 
);

create table `position` (
id int primary key auto_increment,
name varchar(45),
is_delete bit(1)
);

create table user(
user_name varchar(255) primary key,
password varchar(255),
is_delete bit(1)
);

create table role (
role_id int primary key auto_increment,
role_name varchar(255),
is_delete bit(1)
);

create table user_role(
role_id int,
user_name varchar(255),
is_delete bit(1) default 0,
primary key (role_id, user_name),
foreign key (role_id) references role(role_id),
foreign key (user_name) references user(user_name)
);

create table employee(
id int primary key auto_increment,
name varchar(50) not null,
date_of_birth varchar(50) not null,
id_card varchar(12) not null,
salary double not null,
phone_number varchar(12) not null,
email varchar(45),
address varchar(50),
position_id int,
education_degree_id int,
division_id int,
user_name varchar(255),
is_delete bit(1),
foreign key(position_id) references `position`(id),
foreign key(education_degree_id) references education_degree(id),
foreign key(division_id) references division(id),
foreign key(user_name) references user(user_name)
);

create table customer_type(
id int primary key auto_increment,
name varchar(50),
is_delete bit(1)
);

create table customer(
id int primary key auto_increment,
customer_type_id int,
foreign key(customer_type_id) references customer_type(id),
name varchar(50) not null,
gender bit(1) not null,
date_of_birth varchar(50) not null,
id_card varchar(12) not null,
phone_number varchar(12) not null,
email varchar(45),
address varchar(50),
is_delete bit(1)
);

create table facility_type(
id int primary key auto_increment,
name varchar(45),
is_delete bit(1)
);

create table rent_type(
id int primary key auto_increment,
name varchar(50),
is_delete bit(1)
);

create table facility(
id int primary key auto_increment,
name varchar(50) not null,
area int,
cost double,
max_people int,
rent_type_id int,
facility_type_id int,
foreign key(rent_type_id) references rent_type(id),
foreign key(facility_type_id) references facility_type(id),
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
facility_free text,
is_delete bit(1)
);


create table contract(
id int primary key auto_increment,
start_date datetime not null,
end_date datetime not null,
deposit double not null,
employee_id int,
customer_id int,
facility_id int,
is_delete bit(1),
foreign key(employee_id) references employee(id),
foreign key(customer_id) references customer(id),
foreign key(facility_id) references facility(id)
);

create table attach_facility(
id int primary key auto_increment,
name varchar(45) not null,
cost double not null,
unit varchar(10) not null,
status varchar(45),
is_delete bit(1)
);

create table contract_detail(
id int primary key auto_increment,
contract_id int,
attach_facility_id int,
foreign key(contract_id) references contract(id),
foreign key(attach_facility_id) references attach_facility(id),
quantity int not null,
is_delete bit(1)
);

insert into division(name) values
('Lễ tân'),
('Phục vụ'),
('Chuyên viên'),
('Giám sát'),
('Quản lý'),
('Giám đốc');

select * from division;

delete from division
where name = 'Lễ tân';

delete from division;

set sql_safe_updates = 0;

set sql_safe_updates = 1;

alter table division auto_increment = 1;

alter table division 
modify is_delete bit(1) default 0;

alter table education_degree
modify is_delete bit(1) default 0;

insert into education_degree(name) values
('Trung cấp'),
('Cao đẳng'),
('Đại học'),
('Sau đại học');

select * from education_degree;

alter table `position`
modify is_delete bit(1) default 0;

insert into `position`(name) values
('Sale-Marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý');

select * from `position`;

alter table customer_type
modify is_delete bit(1) default 0;

insert into customer_type(name) values
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

select * from customer_type;

alter table rent_type
modify is_delete bit(1) default 0;

insert into rent_type(name) values
('Năm'),
('Tháng'),
('Ngày'),
('Giờ');

select * from rent_type;

alter table facility_type
modify is_delete bit(1) default 0;

insert into facility_type(name) values
('Villa'),
('House'),
('Room');


select * from facility_type;

alter table role
modify is_delete bit(1) default 0;

insert into role(role_name) values
('admin'),
('Sale-Marketing'),
('Hành chính'),
('Phục vụ');







