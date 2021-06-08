DROP TABLE IF exists exhibitions.halls;

CREATE TABLE IF NOT EXISTS exhibitions.halls (
  id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL UNIQUE,
  capacity INT UNSIGNED NOT NULL,
  PRIMARY KEY (id)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET utf8mb4;



insert into exhibitions.halls (name, capacity) values ('RED', 100);
insert into exhibitions.halls (name, capacity) values ('GREEN', 150);
insert into exhibitions.halls (name, capacity) values ('BLUE', 200);
insert into exhibitions.halls (name, capacity) values ('YELLOW', 250);

select * from exhibitions.halls;

select sum(capacity) as max from halls;

select * from halls order by id;

select * from halls;

select halls.id, halls.name, halls.capacity from halls
JOIN exhibition_halls ON (exhibition_halls.hall_id = halls.id)
JOIN exhibitions ON (exhibitions.id = exhibition_halls.exhibition_id)
WHERE exhibitions.id = 1;

select halls.id, halls.name, halls.capacity from halls
JOIN exhibition_halls ON (exhibition_halls.hall_id = halls.id)
JOIN exhibitions ON (exhibitions.id = exhibition_halls.exhibition_id)
WHERE exhibitions.id = 1;