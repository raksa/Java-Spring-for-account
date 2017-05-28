CREATE USER '@jdbc.mysql.username@'@'@jdbc.host@' IDENTIFIED BY '@jdbc.mysql.password@';
CREATE DATABASE `@jdbc.mysql.dbname@`;
GRANT ALL PRIVILEGES ON `@jdbc.mysql.dbname@`.* TO '@jdbc.mysql.username@'@'@jdbc.host@';