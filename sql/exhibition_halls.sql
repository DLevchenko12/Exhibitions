DROP TABLE IF EXISTS exhibitions.exhibition_halls ;

CREATE TABLE IF NOT EXISTS exhibitions.exhibition_halls (
  exhibition_id INT NOT NULL,
  hall_id INT NOT NULL,
  UNIQUE (exhibition_id, hall_id),
  PRIMARY KEY (exhibition_id, hall_id),
  INDEX fk_exhibitions_has_halls_halls1_idx (hall_id ASC) VISIBLE,
  INDEX fk_exhibitions_has_halls_exhibitions1_idx (exhibition_id ASC) VISIBLE,
    FOREIGN KEY (exhibition_id)
    REFERENCES exhibitions.exhibitions (id)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (hall_id)
    REFERENCES exhibitions.halls (id)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB
DEFAULT CHARACTER SET utf8mb4;

insert into exhibition_halls values (1, 1);
insert into exhibition_halls values (1, 3);

insert into exhibition_halls values (2, 2);
insert into exhibition_halls values (2, 3);

insert into exhibition_halls values (3, 1);
insert into exhibition_halls values (3, 4);

insert into exhibition_halls values (4, 2);
insert into exhibition_halls values (4, 4);

select halls.name AS hall from exhibitions
JOIN exhibition_halls ON (exhibitions.id = exhibition_halls.exhibition_id)
JOIN halls ON (exhibition_halls.hall_id = halls.id)
WHERE exhibitions.start_date >= '2020-09-12' AND exhibitions.end_date <= '2020-09-13'
AND exhibitions.start_time between '11:00' AND '16:00'
AND exhibitions.end_time between '11:00' AND '16:00';

select exhibitions.id, halls.name as name from exhibitions
JOIN exhibition_halls ON (exhibitions.id = exhibition_halls.exhibition_id)
JOIN halls ON (exhibition_halls.hall_id = halls.id)
WHERE
halls.id = 3
AND
(exhibitions.start_date between '2020-09-12' AND '2020-09-13'
OR
exhibitions.end_date between '2020-09-12' AND '2020-09-13')
AND
(exhibitions.start_time between '12:00' AND '17:00'
OR
exhibitions.end_time between '12:00' AND '17:00');

select * from exhibition_halls order by exhibition_id;