# Account management with Spring and MySQL

## Prerequisites
- JDK 1.8 or later
- Maven 3 or later
- MySQL 5.6 or later

## Stack
- Spring MVC
- Spring Security
- Spring Data JPA
- Maven
- JSP
- MySQL

## Call for Database
* create database `accounts`
* create user `account` with password `account` grain access database `accounts`
* run maven phase to auto generate database
```
$ mvn generate-sources
```



## Test
```
$ mvn test
```

## Build war
```
$ mvn package
```