# Database Storage

###### Comparison between different formats and compression methods

## Database example 

### countries         
     
id  | name
--- | ------
1   | France
2   | Italy
3   | Spain

### cities

id | name    | country
---| ------- | -------
|1|Nice     |1|
|2|Paris    |1|
|3|Lyon     |1|
|4|Marseille|1|
|5|Roma     |2|
|6|Milano   |2|
|7|Turino   |2|
|8|Madrid   |3|
|9|Barcelona|3|


## PostgreSQL
```
sudo -i -u postgres
psql
create database countries;
\c countries;
create table countries (id serial primary key, name varchar(50) not null);
insert into countries (name) values ('France');
insert into countries (name) values ('Italy');
insert into countries (name) values ('Spain');
create table cities (id serial primary key, name varchar(50) not null, country integer references countries (id));
insert into cities (name, country) values ('Nice', 1);
insert into cities (name, country) values ('Paris', 1);
insert into cities (name, country) values ('Lyon', 1);
insert into cities (name, country) values ('Marseille', 1);
insert into cities (name, country) values ('Roma', 2);
insert into cities (name, country) values ('Milano', 2);
insert into cities (name, country) values ('Turino', 2);
insert into cities (name, country) values ('Madrid', 3);
insert into cities (name, country) values ('Barcelona', 3);
\q
pg_dump -U postgres countries | gzip -9> postgres_countries-9.sql.gz
pg_dump -U postgres countries | gzip > postgres_countries.sql.gz
pg_dump -U postgres countries | zip> postgres_countries.sql.zip
pg_dump -U postgres countries | bzip2 > postgres_countries.sql.bz2
pg_dump -U postgres countries | lzma > postgres_countries.sql.lzma
pg_dump -U postgres countries > postgres_countries.sql
pg_dump -U postgres -Fc countries | gzip -9> postgres_countries-9.dump.gz
pg_dump -U postgres -Fc countries | gzip > postgres_countries.dump.gz
pg_dump -U postgres -Fc countries | zip> postgres_countries.dump.zip
pg_dump -U postgres -Fc countries | bzip2 > postgres_countries.dump.bz2
pg_dump -U postgres -Fc countries | lzma > postgres_countries.dump.lzma
pg_dump -U postgres -Fc countries > postgres_countries.dump
pg_dump -U postgres -Ft countries | gzip -9> postgres_countries-9.tar.gz
pg_dump -U postgres -Ft countries | gzip > postgres_countries.tar.gz
pg_dump -U postgres -Ft countries | zip> postgres_countries.tar.zip
pg_dump -U postgres -Ft countries | bzip2 > postgres_countries.tar.bz2
pg_dump -U postgres -Ft countries | lzma > postgres_countries.tar.lzma
pg_dump -U postgres -Ft countries > postgres_countries.tar
```

## MySQL
```
mysql -u root -p
create database countries;
show databases;
use countries;
create table countries (id int not null auto_increment, name varchar(50) not null, primary key (id));
insert into countries (name) values ('France');
insert into countries (name) values ('Italy');
insert into countries (name) values ('Spain');
create table cities (id int not null auto_increment, name varchar(50) not null, country int not null, primary key (id), foreign key (country) references countries(id));
show tables;
insert into cities (name, country) values ('Nice', 1);
insert into cities (name, country) values ('Paris', 1);
insert into cities (name, country) values ('Lyon', 1);
insert into cities (name, country) values ('Marseille', 1);
insert into cities (name, country) values ('Roma', 2);
insert into cities (name, country) values ('Milano', 2);
insert into cities (name, country) values ('Turino', 2);
insert into cities (name, country) values ('Madrid', 3);
insert into cities (name, country) values ('Barcelona', 3);
exit
mysqldump -u root -p countries > mysql_countries.sql
mysqldump -u root -p countries | gzip -9> mysql_countries-9.sql.gz
mysqldump -u root -p countries | gzip > mysql_countries.sql.gz
mysqldump -u root -p countries | zip> mysql_countries.sql.zip
mysqldump -u root -p countries | bzip2 > mysql_countries.sql.bz2
mysqldump -u root -p countries | lzma > mysql_countries.sql.lzma
```
## SQLite
```
sqlite3 countries.db
create table countries (id integer primary key autoincrement , name text not null);
insert into countries (name) values ('France');
insert into countries (name) values ('Italy');
insert into countries (name) values ('Spain');
create table cities (id integer primary key autoincrement, name text not null, country integer not null, foreign key (country) references countries(id));
insert into cities (name, country) values ('Nice', 1);
insert into cities (name, country) values ('Paris', 1);
insert into cities (name, country) values ('Lyon', 1);
insert into cities (name, country) values ('Marseille', 1);
insert into cities (name, country) values ('Roma', 2);
insert into cities (name, country) values ('Milano', 2);
insert into cities (name, country) values ('Turino', 2);
insert into cities (name, country) values ('Madrid', 3);
insert into cities (name, country) values ('Barcelona', 3);
.output ./sqlite_countries.sql
.dump
.exit
gzip -c sqlite_countries.sql > sqlite_countries.sql.gz
gzip -9c sqlite_countries.sql > sqlite_countries-9.sql.gz
zip -c sqlite_countries.sql > sqlite_countries.sql.zip
bzip2 -c sqlite_countries.sql > sqlite_countries.sql.bz2
lzma -c sqlite_countries.sql  > sqlite_countries.sql.lzma
```

## JSON
```
gzip -c countries.min.json > countries.min.json.gz
gzip -9c countries.min.json > countries-9.min.json.gz
zip -c countries.min.json > countries.min.json.zip
bzip2 -c countries.min.json > countries.min.json.bz2
lzma -c countries.min.json  > countries.min.json.lzma
```

## XML
```
gzip -c countries.min.xml > countries.min.xml.gz
gzip -9c countries.min.xml > countries-9.min.xml.gz
zip -c countries.min.xml > countries.min.xml.zip
bzip2 -c countries.min.xml > countries.min.xml.bz2
lzma -c countries.min.xml  > countries.min.xml.lzma
```

## CSV
```
gzip -c countries_csv.tar > countries_csv.tar.gz
gzip -9c countries_csv.tar > countries_csv-9.tar.gz
zip -c countries_csv.tar > countries_csv.tar.zip
bzip2 -c countries_csv.tar > countries_csv.tar.bz2
lzma -c countries_csv.tar > countries_csv.tar.lzma
```

## Apache Parquet
```
tar -cvf countries_parquet.tar countries.parquet cities.parquet
gzip -c countries_parquet.tar > countries_parquet.tar.gz
gzip -9c countries_parquet.tar > countries_parquet-9.tar.gz
zip -c countries_parquet.tar > countries_parquet.tar.zip
bzip2 -c countries_parquet.tar > countries_parquet.tar.bz2
lzma -c countries_parquet.tar > countries_parquet.tar.lzma
```

## SIARD 
```
gzip -c countries.siard > countries.siard.gz
gzip -9c countries.siard  > countries-9.siard.gz
bzip2 -c countries.siard  > countries.siard.bz2
lzma -c countries.siard  > countries.siard.lzma
```
