DROP TABLE IF EXISTS exhibitions.orders;

CREATE TABLE IF NOT EXISTS exhibitions.orders (
  order_id INT AUTO_INCREMENT,
  user_id INT NOT NULL,
  exhibition_id INT NOT NULL,
  tickets_amount INT NOT NULL,
  PRIMARY KEY (order_id),
    FOREIGN KEY (exhibition_id) REFERENCES exhibitions.exhibitions (id)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (user_id)
    REFERENCES exhibitions.users (id)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB
DEFAULT CHARACTER SET utf8mb4;

select * from orders;

update exhibitions.exhibitions set exhibitions.remaining_seats=((select exhibitions.remaining_seats where exhibitions.id=2)-5) where exhibitions.id=2;
insert into orders (user_id, exhibition_id, tickets_amount) values (2, 2, 5);

update exhibitions.exhibitions set exhibitions.remaining_seats=((select exhibitions.remaining_seats where exhibitions.id=3)-10) where exhibitions.id=3;
insert into orders (user_id, exhibition_id, tickets_amount) values (2, 3, 10);

select * from orders
join exhibitions ON (orders.exhibition_id=exhibitions.id)
join categories ON (category_id=categories.id)
where user_id=2 AND exhibitions.id=3;

select * from orders as o
join exhibitions as e ON (o.exhibition_id=e.id)
join categories as c ON (e.category_id=c.category_id)
where user_id=2
LIMIT 2 OFFSET 0;

delete from orders where id =3;

select count(order_id) as count from orders;