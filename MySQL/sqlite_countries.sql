PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE countries (id integer primary key autoincrement , name text not null);
INSERT INTO countries VALUES(1,'France');
INSERT INTO countries VALUES(2,'Italy');
INSERT INTO countries VALUES(3,'Spain');
CREATE TABLE cities (id integer primary key autoincrement, name text not null, country integer not null, foreign key (country) references countries(id));
INSERT INTO cities VALUES(1,'Nice',1);
INSERT INTO cities VALUES(2,'Paris',1);
INSERT INTO cities VALUES(3,'Lyon',1);
INSERT INTO cities VALUES(4,'Lyon',1);
INSERT INTO cities VALUES(5,'Roma',2);
INSERT INTO cities VALUES(6,'Milano',2);
INSERT INTO cities VALUES(7,'Turino',2);
INSERT INTO cities VALUES(8,'Madrid',3);
INSERT INTO cities VALUES(9,'Barcelona',3);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('countries',3);
INSERT INTO sqlite_sequence VALUES('cities',9);
COMMIT;