# Fundamentals Oracle
At this moment, I'm currently reviewing more contents about Oracle database like query, procedures and etc.

  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/oracle/oracle-original.svg" alt="oracle" width="40" height="40"/>

# Oracle sql the words reserved:
**_<span style="color: #1589F0">
    SELECT, AS, FROM, WHERE, AND, OR, ORDER BY, DISTINCT, IN, DESC, ASC, HAVING, LIKE, BETWEEN, IS, NOT, NULL, NULLS, FIRST
</span>_**

# Create database with intregation Docker Tutorial
https://medium.com/xp-inc/dica-r%C3%A1pida-criando-base-de-dados-oracle-vers%C3%A3o-21-3-0-no-docker-357b05754b84

**First** clone the repositories

    git clone https://github.com/oracle/docker-images.git

**Second** go this directory your machine

  *cd docker-images/OracleDatabase/SingleInstance/dockerfiles*

**Third** to open o git bash and to execute this command here

    ./buildContainerImage.sh -v 21.3.0 -x

**Fourth** to execute this command to create a container on docker

    docker run --name oracle -d -p 51521:1521 -p 55500:5500 -e ORACLE_PWD=dev1990 -e ORACLE_CHARACTERSET=AL32UTF8 oracle/database:21.3.0-xe

**Fifth** to check the new container for it.

    docker ps
  

**In oracle sql the functions**: are built into Oracle Database and are available for use in various appropriate SQL statements.

**_MIN()_**     is a function to show min.

**_MAX()_**     is a function to show max.

**_COUNT()_**   is a function to count a data.

**_AVG()_**     is a function to calculate a average.

**_NVL()_**     is a function to replace a field null new text.

**_COALESCE_**  is a function to replace the fields to new message for example.

**_NVL2()_**    is a function to replace a field null new text.

**_NULLIF()_**  is a function return the fields are null.

**_LNNVL()_**   is a function return a boolean similar an if.

**_SUBSTR_**    is a funtion on oracle to work text.

**UPPER_**      is a function on oracle to upper a word or text.

**_LOWER_**     is a function on oracle to lower a word or text.

**_INITCAP_**   is a function on oracle that returns char , with the first letter of each word in uppercase, all other letters in lowercase.

**_REPLACE_**   is a function on oracle to replace a word other text.

**_LENGTH_**    is a function on oracle to count the number caracters of word.

**_CONCAT_**    is a function on oracle to concat two words.

**_TRUNC_**     is a funtion on oracle that returns n1 truncated to n2 decimal places. If n2 is omitted, then n1 is truncated to 0 places.

**_ROUND_**     is a function on oracle that rounded to integer places to the right of the decimal point.

**_FLOOR_**     is a function on oracle that returns the largest integer equal to or less than n.

**_CEIL_**      is a funtion on oracle that returns the smallest integer that is greater than or equal to n.

**_SIGN_**      is a funtion on oracle that takes as an argument any numeric data type, or any nonnumeric data type that can be implicitly converted to NUMBER.

**_MOD_**       is a funtion on oracle that returns the remainder of n2 divided by n1.

**_SYSDATE_**   is a funtion on oracle that returns the current date and time set for the operating system on which the database server resides.

**_SYSTIMESTAMP_**   is a funtion on oracle that  returns the system date, including fractional seconds and time zone, of the system on which the database resides.

**_ADD_MONTHS_**     is a funtion on oracle that  returns the date date plus integer months.

**_MONTHS_BETWEEN_** is a function on oracle that returns number of months between dates date1 and date2.

**_EXTRACT_**        is a funtion on oracle that extracts and returns the value of a specified datetime field from a datetime or interval expression.

**_NEXT_DAY_**       is a funtion on oracle that returns the date of the first weekday named by char that is later than the date date.

**_TRUNC_**          is a funtion on oracle that returns n1 truncated to n2 decimal places. If n2 is omitted, then n1 is truncated to 0 places.

**_TO_CHAR_**        is a function on oracle that (datetime) converts a datetime or interval value of DATE, TIMESTAMP, TIMESTAMP WITH TIME ZONE, TIMESTAMP WITH LOCAL TIME ZONE, INTERVAL DAY TO SECOND, or INTERVAL YEAR TO MONTH data type to a value of VARCHAR2 data type in the format specified by the date format fmt.

**_TO_NUMBER_**      is a function on oracle that onverts expr to a value of NUMBER data type.

**_TO_DATE_**        is a funtion on oracle that converts char to a value of DATE data type.

**_CAST_**           is a funtion on oracle that convert built-in data types or collection-typed values of one type into another built-in data type or collection type.
