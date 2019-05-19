/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */
 
 /* Сделано для БД MySQL*/

/* 1. Создаем таблицы БД и взаимосвязи */
create table ROLES (
	ID integer(10) unique not null,
    `NAME` varchar(255) primary key
);

create table USERINFO (
	ID integer(10) primary key,
    `NAME` varchar(255), /* NAME – зарезервированное слово, в MySQL такие слова выделяются с помощью символа обратного апострофа (back quote) " ` " */
    SURNAME varchar(255)
);

create table `USER` (
	ID integer(10) not null unique auto_increment, 
    EMAIL varchar(255) not null primary key,
    `PASSWORD` varchar(255) not null,
    INFO integer(10) not null unique references USERINFO (ID),
    `ROLE` integer(10) not null references ROLES (ID)
);

create table `ORDER` ( 
	ID integer(10) not null auto_increment primary key, /* В MySQL используется "auto_increment" вместо "generated alwaysas identity" */
    `USER` integer(10) not null references `USER` (ID),
    CREATED timestamp not null
);

create table SUPPLIER (
	ID integer(10) not null unique auto_increment,
    `NAME` varchar(255) not null primary key,
    ADDRESS varchar(255),
    PHONE varchar(255) not null,
    REPRESENTATIVE varchar(255)
);

create table PRODUCT (
	ID integer(10) not null unique auto_increment,
    `CODE` varchar(255) not null primary key,
    TITLE varchar(255) not null,
    SUPPLIER integer(10) not null references SUPPLIER (ID),
    INITIAL_PRICE double not null,
    RETAIL_VALUE double not null
);

create table ORDER2PRODUCT (
	`ORDER` integer(10) not null references `ORDER` (ID),
    PRODUCT integer(10) not null references PRODUCT (ID),
    constraint pk_order_product primary key (`ORDER`, PRODUCT)
);

/* 2. Добавляем записи */
-- в ROLES
insert into ROLES (ID, `NAME`) values (1, 'admin');
insert into ROLES (ID, `NAME`) values (2, 'customer');
insert into ROLES (ID, `NAME`) values (3, 'user');
-- в USERINFO
insert into USERINFO (ID, `NAME`, SURNAME) values (1, 'Edvard', 'McRoy');
insert into USERINFO (ID, `NAME`, SURNAME) values (2, 'Sofi', 'Galar');
insert into USERINFO (ID, `NAME`, SURNAME) values (3, 'Philip', 'Keins');
-- в USER
insert into `USER` (EMAIL, `PASSWORD`, INFO, `ROLE`) values ('ebdacarr@mail.ru', '6spdW~4H', 11, 2);
insert into `USER` (EMAIL, `PASSWORD`, INFO, `ROLE`) values ('sifilakie@gmail.com', 'xH3?ykWl', 12, 3);
insert into `USER` (EMAIL, `PASSWORD`, INFO, `ROLE`) values ('phayllye@yandex.ru', 'X?j0x$T#', 13, 1);
-- в ORDER
insert into `ORDER` (`USER`, CREATED) values (1423, default);
insert into `ORDER` (`USER`, CREATED) values (1123, default);
insert into `ORDER` (`USER`, CREATED) values (7851, default);
-- в SUPPLIER
insert into SUPPLIER (`NAME`, ADDRESS, PHONE, REPRESENTATIVE) 
values ('Avilon Inds.', '635 Stroop Hill Road, Monticello', '404-838-5314', 'Alexander Cooper');
insert into SUPPLIER (`NAME`, ADDRESS, PHONE, REPRESENTATIVE) 
values ('Bars Ltd', '249 Hickory Heights Drive, Columbia', '443-838-2041', 'Brian Pope');
insert into SUPPLIER (`NAME`, ADDRESS, PHONE, REPRESENTATIVE) 
values ('Gear Motors Inds.', '4911 Glenwood Avenue, Cleveland', '216-373-4680', 'Gordon Kennedy');
-- в PRODUCT
insert into PRODUCT (`CODE`, TITLE, SUPPLIER, INITIAL_PRICE, RETAIL_VALUE) 
values ('repair_parts', 'inner fender', 1, 12600.34, 18900);  
insert into PRODUCT (`CODE`, TITLE, SUPPLIER, INITIAL_PRICE, RETAIL_VALUE) 
values ('engine', 'valves 231', 2, 1987.59, 3500);  
insert into PRODUCT (`CODE`, TITLE, SUPPLIER, INITIAL_PRICE, RETAIL_VALUE) 
values ('glass', 'windshield', 3, 14123.42, 20000);
-- в ORDER2PRODUCT
insert into ORDER2PRODUCT (`ORDER`, PRODUCT) values (234, 678);
insert into ORDER2PRODUCT (`ORDER`, PRODUCT) values (937, 561);
insert into ORDER2PRODUCT (`ORDER`, PRODUCT) values (890, 211);