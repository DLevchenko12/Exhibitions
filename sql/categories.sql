DROP TABLE IF EXISTS exhibitions.categories ;

CREATE TABLE IF NOT EXISTS exhibitions.categories (
  category_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL UNIQUE,
  description VARCHAR(255) NULL,
  PRIMARY KEY (category_id))
ENGINE = InnoDB;

insert into categories (name) values ('sport');
insert into categories (name) values ('auto');
insert into categories (name) values ('science');
insert into categories (name) values ('techno');

select * from categories order by name;

-- RENAME TABLE topics TO categories;

SELECT * FROM categories WHERE id = 1;

alter table categories rename column id TO category_id;