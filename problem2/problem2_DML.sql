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

SELECT name FROM member
WHERE join_date >= '2000-09-01 00:00:00';

SELECT * FROM member
WHERE join_date BETWEEN '1995-10-01 00:00:00' and '2019-10-01 00:00:00';

SELECT @publisher_id := publisher_id FROM publisher WHERE name='Oxford';
SELECT *
FROM book 
WHERE pub_id=@publisher_id OR price BETWEEN 15 AND 20;

SELECT @member_id := member_id FROM member WHERE name='Scot Reinger';
SELECT title
FROM book
WHERE EXISTS (SELECT book_id FROM borrowing_book WHERE borrowing_book.book_id=book.book_id AND borrowing_book.member_id=@member_id);

SELECT name
FROM member
WHERE EXISTS (SELECT book_id FROM borrowing_book WHERE borrowing_book.member_id=member.member_id AND borrowing_book.borrow_date BETWEEN '2019-01-01 00:00:00' and '2019-12-31 00:00:00');