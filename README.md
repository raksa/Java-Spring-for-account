# Account management with Spring and MySQL or Oracle XE
MySQL is default database, 

For Oracle XE choice let got to:
* change configuration in `account/src/main/resources/application.properties`
* change `SequenceGenerator` for each model in `account/src/main/java/net/k4us/account/model`
* call for database Oracle XE


## Prerequisites for current success test
- JDK 1.8 or later
- Maven 3 or later
- MySQL 5.6 or later
- Oracle XE 11g
- Apache Ant 1.10.1

## Stack
- Spring MVC
- Spring Security
- Spring Data JPA
- Maven
- JSP
- MySQL
- Oracle XE

## Call for Database MySQL
* run ant task to auto generate database with new user and database
```
$ ant db_mysql_drop_user
$ ant db_mysql_create_user
$ ant db_mysql
```
* or run ant task to auto generate database with existing user and database in (properties)
```
$ ant db_mysql
```
## Call for Database Oracle XE
* in case of using Oracle XE, need to install maven dependency provider for oracle first

For Windows
```
> mvn install:install-file -Dfile=C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib\ojdbc6.jar
      -DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0 -Dpackaging=jar
```
For Linux
```
$ mvn install:install-file -Dfile=/u01/app/oracle/product/11.2.0/xe/jdbc/lib/ojdbc6.jar
      -DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0 -Dpackaging=jar
```
* run ant task to auto generate database with new user
```
$ ant db_oracle_user
$ ant db_oracle
```
* or run ant task to auto generate database with existing user in (properties)
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

## TODO
* register new user using email or phone
* confirm via email or phone
* login by email or phone
* control user's role

## Others
* e.g import data using CSV (need to set `auto_increment` manually)
```
$ mysqlimport --ignore-lines=1 --fields-terminated-by=, --local -u "user_name" -p "db_name" databases/user_account.csv
```
* welcome for any help