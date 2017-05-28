CREATE USER 'account'@'localhost' IDENTIFIED BY 'account';
CREATE DATABASE `accounts`;
GRANT ALL PRIVILEGES ON `accounts`.* TO 'account'@'localhost';