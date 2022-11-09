Create Database library_management_system;

create table book(
book_id int not null auto_increment,
title varchar(225) not null,
price int not null,
pub_id int not null,
category_id int not null,
PRIMARY KEY (book_id)
);

create table category(
category_id int not null auto_increment,
name varchar(225) not null,
PRIMARY KEY (category_id)
);

create table publisher(
publisher_id int not null auto_increment,
name varchar(225) not null,
address varchar(225) not null,
PRIMARY KEY (publisher_id)
);

create table member(
member_id int not null auto_increment,
name varchar(225) not null,
address varchar(225) not null,
join_date timestamp not null,
PRIMARY KEY (member_id)
);

create table borrowing_book(
member_id int not null,
book_id int not null,
return_date timestamp not null,
due_date timestamp not null,
borrow_date timestamp DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE book ADD FOREIGN KEY (pub_id)
REFERENCES publisher(publisher_id);

ALTER TABLE book ADD FOREIGN KEY (category_id)
REFERENCES category(category_id);

ALTER TABLE borrowing_book ADD FOREIGN KEY (member_id)
REFERENCES member(member_id);

ALTER TABLE borrowing_book ADD FOREIGN KEY (book_id)
REFERENCES book(book_id);
