# Account management with Spring and MySQL

## Prerequisites
- JDK 1.8 or later
- Maven 3 or later
- MySQL 5.6 or later
- Oracle XE 11g (TODO)

## Stack
- Spring MVC
- Spring Security
- Spring Data JPA
- Maven
- JSP
- MySQL

## Call for Database MySQL
* run ant task to auto generate database with new user and database
```
$ ant db_mysql_all
```
* run ant task to auto generate database with existing user(account/account) database(accounts)
```
$ ant db_mysql
```
## Call for Database Oracle XE (TODO)
* run ant task to auto generate database with new user
```
$ ant db_oracle_all
```
* run ant task to auto generate database with existing user(account/account)
```
$ ant db_oracle
```

## Test
```
$ mvn test
```

## Build war
```
$ mvn package
```

Others
-----------------------
* welcome for any help