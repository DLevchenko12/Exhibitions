DROP TABLE IF EXISTS exhibitions.exhibitions;

CREATE TABLE IF NOT EXISTS exhibitions.exhibitions (
  id INT AUTO_INCREMENT,
  category_id INT NOT NULL,
  topic varchar(255) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  price int unsigned not null,
  capacity INT NOT NULL,
  remaining_seats INT NOT NULL,
  status ENUM('active', 'canceled') NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (category_id)
    REFERENCES exhibitions.categories (id)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB
DEFAULT CHARACTER SET utf8mb4;

insert into exhibitions
(category_id, topic, start_date, end_date, start_time, end_time, price, capacity, remaining_seats, status)
values (1, 'Demonstration of new football goals', '20-09-12', '20-09-13', '12:00', '15:00', 150, 300, 300, 'active');

insert into exhibitions
(category_id, topic, start_date, end_date, start_time, end_time, price, capacity, remaining_seats, status)
values (2, 'New green technologies', '20-09-17', '20-09-18', '13:30', '18:50', 200, 350, 350, 'active');

insert into exhibitions
(category_id, topic, start_date, end_date, start_time, end_time, price, capacity, remaining_seats, status)
values (2, 'Новые зелёные технологии', '20-11-17', '20-11-18', '13:30', '18:50', 200, 350, 350, 'active');

insert into exhibitions
(category_id, topic, start_date, end_date, start_time, end_time, price, capacity, remaining_seats, status)
values (3, 'Video games in our life', '20-11-17', '20-11-18', '19:00', '22:00', 250, 400, 400, 'active');

select * from exhibitions where id=3;
select * from exhibitions;