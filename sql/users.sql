drop table if exists exhibitions.users;

create table exhibitions.users (
id int auto_increment primary key,
email varchar(256) not null unique,
password varchar(256) not null,
role enum('ADMIN', 'USER'))
DEFAULT CHARACTER SET utf8mb4;

insert into users (email, password, role)
values ('ihor.kucher.94@gmail.com', 'da4580940a6501402f5e028fb2dc4ea100b1a2dd2de4308589866bf695235c80', 'admin');

insert into users (email, password, role)
values ('hvac.kucher.ihor@gmail.com', 'f229a72a4c9b92a92e385a84ac39c4d59fbe7796c76f06d85c560921fd5d58d3', 'user');

insert into users (email, password, role)
values ('kucher.ihor@gmail.com', 'f229a72a4c9b92a92e385a84ac39c4d59fbe7796c76f06d85c560921fd5d58d3', 'user');

delete from users where id > 2;

SELECT * FROM exhibitions.users;

-- desc users;

select email from users where email='hvac.kucher.ihor@gmail.com';

UPDATE users SET role='ADMIN' where id=10;
UPDATE users SET role='USER' where id>1;