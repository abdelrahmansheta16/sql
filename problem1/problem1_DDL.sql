Create Database company; 

create table employee(
ssn int not null auto_increment,
fname varchar(225) not null,
lname varchar(225) not null,
dno int not null,
address varchar(225) not null,
gender varchar(225) not null,
salary varchar(225) not null,
bdate timestamp not null,
PRIMARY KEY (ssn)
);

create table department(
dnumber int not null auto_increment,
dname varchar(225) not null,
mgr_ssn int not null,
mgr_start_date timestamp not null,
PRIMARY KEY (dnumber)
);

create table project(
pnumber int not null auto_increment,
pname varchar(225) not null,
plocation varchar(225) not null,
dno int not null,
PRIMARY KEY (pnumber)
);

ALTER TABLE employee ADD FOREIGN KEY (dno)
REFERENCES department(dnumber);

ALTER TABLE department ADD FOREIGN KEY (mgr_ssn)
REFERENCES employee(ssn);

ALTER TABLE project ADD FOREIGN KEY (dno)
REFERENCES department(dnumber);